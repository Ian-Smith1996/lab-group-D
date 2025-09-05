.PHONY: clean all

PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/14_2_Rel1
CPP=arm-none-eabi-cpp
CC=arm-none-eabi-gcc
AS=arm-none-eabi-as
LD=arm-none-eabi-ld
SRC=main.c whatever.c
OBJS=$(patsubst %.c,%.o,$(SRC))

all: firmware.elf

hello.txt:
	echo "hello world!" > hello.txt

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) $< -S $@

%.o: %.s
	$(AS) $< -o $@
	
firmware.elf: $(OBJS)
	$(LD) -o $@ $^

clean:
	rm -f *.i *.s *.o *.elf hello.txt