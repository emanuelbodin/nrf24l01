MCU=atmega328p
MCU2=m328
CC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-std=c99 -Wall -g -Os -mmcu=${MCU} -I .
TARGET=main
SRCS=main.c  /Users/emanuelbodin/Documents/AVR/super_nrf/nrf24l01.c

all:
	${CC} ${CFLAGS} -o ${TARGET}.bin ${SRCS}
	${OBJCOPY} -j .text -j .data -O ihex ${TARGET}.bin ${TARGET}.hex

flash:
	avrdude -p ${MCU2} -c usbasp -U flash:w:${TARGET}.hex:i -F -P usb -B 4.0

clean:
	rm -f *.bin *.hex	