#ifndef GRAPHIC_DISPLAY_H
#define GRAPHIC_DISPLAY_H
#include "types.h"


#define PORT_BASE   0x40021000
#define portModer (*((volatile uint32*)PORT_BASE))
#define portOtyper (*((volatile uint16*)(PORT_BASE + 0x4)))
#define portOspeedr (*((volatile uint32*)(PORT_BASE + 0x8)))
#define portPupdr	(*((volatile uint32*) (PORT_BASE + 0xC)))

#define portIdrLow (*((volatile uint8*)(PORT_BASE + 0x10)))
#define portIdrHigh (*((volatile uint8*)(PORT_BASE + 0x11)))
#define portOdrLow (*((volatile uint8*)(PORT_BASE + 0x14)))
#define portOdrHigh (*((volatile uint8*)(PORT_BASE + 0x15)))

#define B_E         0x40
#define B_RST       0x20
#define B_CS2       0x10
#define B_CS1       0x08
#define B_SELECT    0x04
#define B_RW        0x02
#define B_RS        0x01

// LCD Display Configuration
#define LCD_ON          0x3F // Display on
#define LCD_OFF         0x3E // Display off
#define LCD_SET_ADD     0x40 // Set horizontal coordinate
#define LCD_SET_PAGE    0xB8 // Set vertical coordinate
#define LCD_DISP_START  0xC0 // Start address
#define LCD_BUSY        0x80 // Read busy status

void graphic_ctrl_bit_set(uint8_c x);
void graphic_ctrl_bit_clear(uint8_c x);

void graphic_write_command(uint8_c command, uint8_c controller);
void graphic_write_data(uint8_c data, uint8_c controller);

uint8 graphic_read_status(void);
uint8_c graphic_read_data(uint8_c controller);

void graphic_write_controller(uint8 byte);
uint8 graphic_read_controller(void);

void graphic_initialize(void);

void pixel(uint8_c x, uint8_c y, uint8_c set);

#endif // GRAPHIC_DISPLAY_H