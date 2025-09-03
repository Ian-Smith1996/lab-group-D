.PHONY: clean all

all: firmware.elf

PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/14_2_Rel1
CPP=arm-none-eabi-cpp
CC=arm-none-eabi-gcc
AS=arm-none-eabi-as
LD=arm-none-eabi-ld
SRC=main.c whatever.c
OBJS=$(patsubst %.c,%.o,$(SRC))

hello.txt:
	echo "hello world!" > hello.txt

# main.i: main.c
# 	$(CPP) main.c > main.i

clean:
	rm -f main.i hello.txt

# main.s: main.i
# 	$(CC) -S main.i

# whatever.s: whatever.c
# 	$(CC) -S whatever.c

%.s: %.c
	$(CC) $< -S $@

%.o: %.s
	$(AS) $< -o $@
	
firmware.elf: $(OBJS)
	$(LD) -o $@ $^