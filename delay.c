#include "delay.h"

#define STK_CTRL ((volatile unsigned int *)(0xE000E010)) 

void delay_250ns( void )
{
	uint32 x = 0;
	SYS_TICK.CTRL = 0;
	SYS_TICK.CTRL_COUNT = 0;
	SYS_TICK.VAL = 0;
	SYS_TICK.LOAD = 42;
	SYS_TICK.CTRL = 0x05;
	
	x = SYS_TICK.VAL;
	while (SYS_TICK.CTRL_COUNT & 0x1 == 0) 
	{
		x = SYS_TICK.VAL;
	}
	SYS_TICK.CTRL = 0;
}

void delay_500ns( void ) 
{
	delay_250ns();
	delay_250ns();
}

void delay_micro( uint32_c us )
{
	for (uint32 loops = 0; loops < us; loops++ )
		{
		delay_250ns();
		delay_250ns();
		delay_250ns();
		delay_250ns();
	}
}

void delay_milli( uint32 ms )
{	
	#ifdef SIMULATOR
	ms = ms / 1000;
	ms++;
	#endif // SIMULATOR
	delay_micro(ms*1000);
};