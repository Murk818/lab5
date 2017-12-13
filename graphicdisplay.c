#include "graphicdisplay.h"
#include "gpio.h"

void graphic_ctrl_bit_set(uint8_c x)
{
	GPIO_E.ODR_LOW |= x;
	GPIO_E.ODR_LOW &= ~B_SELECT;
}

void graphic_ctrl_bit_clear(uint8_c x)
{
	GPIO_E.ODR_LOW &= ~x;
	GPIO_E.ODR_LOW &= ~B_SELECT;
}

void select_controller(uint8_c controller)
{
	graphic_ctrl_bit_clear(B_CS1 | B_CS2);
	graphic_ctrl_bit_set(controller);
}

void graphic_wait_ready(void)
{
	graphic_ctrl_bit_clear(B_E);

	GPIO_E.MODER = 0x00005555;

	graphic_ctrl_bit_set(B_RW);
	graphic_ctrl_bit_clear(B_RS);

	delay_500ns();

	while (TRUE)
	{
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		uint8 status = GPIO_E.IDR_HIGH & LCD_BUSY;
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();
		if (status == 0)
		{
			break;
		}
	}
	
	graphic_ctrl_bit_set(B_E);
	GPIO_E.MODER = 0x55555555;
}

uint8_c graphic_read(uint8_c controller)
{
	graphic_ctrl_bit_clear(B_E);

	GPIO_E.MODER = 0x00005555;

	graphic_ctrl_bit_set(B_RS | B_RW);

	select_controller(controller);
	delay_500ns();

	graphic_ctrl_bit_set(B_E);
	delay_500ns();

	uint8_c rv = GPIO_E.IDR_HIGH;

	graphic_ctrl_bit_clear(B_E);

	GPIO_E.MODER = 0x55555555;

	// TODO: MAY NEED CHANGE
	if(controller == B_CS1)
	{
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller == B_CS2)
	{
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	return rv;
}

uint8_c graphic_read_data(uint8_c controller)
{
	graphic_read(controller);
	return graphic_read(controller);
}

void graphic_write(uint8_c value, uint8_c controller)
{
	GPIO_E.ODR_HIGH = value;

	select_controller(controller);

	delay_500ns();

	graphic_ctrl_bit_set(B_E);

	delay_500ns();

	graphic_ctrl_bit_clear(B_E);

	if(controller & B_CS1)
	{
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller & B_CS2)
	{
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	
	GPIO_E.ODR_HIGH = 0;
	graphic_ctrl_bit_set(B_E);

	select_controller(0);
}

void graphic_write_command(uint8_c command, uint8_c controller)
{
	graphic_ctrl_bit_clear(B_E);

	select_controller(controller);

	graphic_ctrl_bit_clear(B_RS | B_RW);

	graphic_write(command, controller);
}

void graphic_write_data(uint8_c data, uint8_c controller)
{
	graphic_ctrl_bit_clear(B_E);

	select_controller(controller);

	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_clear(B_RW);

	graphic_write(data, controller);
}

void graphic_initialize(void)
{
	graphic_ctrl_bit_set(B_E);
	delay_micro(1); // skall vara 10

	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
	delay_milli(1);//skall vara 30

	graphic_ctrl_bit_set(B_RST);

	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
	graphic_write_command(LCD_ON, B_CS1 | B_CS2);		  // Toggle display
	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2); // start = 0
	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);	// add = 0
	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);   // page = 0
	select_controller(0);								  // deactivate both CS signals
}

void graphic_clear_screen()
{

	for (uint8 i = 0; i < 8; i++)
	{
		graphic_write_command(LCD_SET_PAGE | i, B_CS1 | B_CS2);
		graphic_write_command(LCD_SET_ADD | 0, B_CS1 | B_CS2);
		for (uint8 j = 0; j < 64; j++)
		{
			graphic_write_data(0, B_CS1 | B_CS2);
		}
	}
}

void pixel(uint8_c x, uint8_c y, uint8_c set)
{
	if (x > 128 || x < 1)
		return;

	if (y > 64 || y < 1)
		return;

	uint8_c row = (y - 1) / 8;
	uint8 mask = 1 << ((y - 1) % 8);

	if (set == 0)
	{
		mask = ~mask;
	}

	uint8 controller;
	uint8 column;
	if (x > 64)
	{
		controller = B_CS2;
		column = x - 65;
	}
	else
	{
		controller = B_CS1;
		column = x - 1;
	}

	graphic_write_command(LCD_SET_ADD | column, controller);
	graphic_write_command(LCD_SET_PAGE | row, controller);

	uint8_c temp = graphic_read_data(controller);

	graphic_write_command(LCD_SET_ADD | column, controller);

	if (set)
		mask = mask | temp;
	else
		mask = mask & temp;
	graphic_write_data(mask, controller);
	graphic_write_command(LCD_ON, B_CS1 | B_CS2);	
}
