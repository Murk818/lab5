#ifndef DELAY_H
#define DELAY_H
#include "types.h"

#define SYS_TICK_ADDRESS 0xE000E010
#define ARM_250_CYCLE_TIME 41

typedef struct {
	uint8 		CTRL;
	uint8_c 	RES_CTRL1;
	uint8 		CTRL_COUNT;
	uint8_c 	RES_CTRL2;	
	uint32 		LOAD;
	uint32 		VAL;
} SysTick;

typedef volatile SysTick* SysTickPtr;
#define SYS_TICK (*((SysTickPtr) SYS_TICK_ADDRESS))

void delay_250ns( void );
void delay_500ns( void );
void delay_micro( uint32_c us );
void delay_milli( uint32_c ms );

#endif