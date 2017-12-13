#ifndef GPIO_H
#define GPIO_H
#include "types.h"

#define PORT_D 0x40020C00
#define PORT_E 0x40021000

typedef struct {
	uint32				MODER;
	uint16				OTYPER;
	uint16_c			RES_OT;
	uint32				OSPEEDR;
	uint32				PUPDR;
	union 	{	uint16 	IDR;
				struct {
				uint8	IDR_LOW;
				uint8	IDR_HIGH;
				};
			};
	uint16_c			RES_IDR;
	
	union 	{	uint16	ODR;
				struct {
				uint8	ODR_LOW;
				uint8	ODR_HIGH;
				};
			};
	uint16_c			RES_ODR;
	uint32				BSRR;
	uint16				LOCKR;
	uint8				LOCKR_16;
	uint8_c				RES_LOCKR;
	uint32				AFR1;
	uint32				AFR2;
} gpioPort;

typedef volatile gpioPort* gpioPtr;

#define GPIO_D (*((gpioPtr) PORT_D))
#define GPIO_E (*((gpioPtr) PORT_E))

#endif // GPIO_H