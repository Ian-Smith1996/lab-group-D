hello.txt:
	echo "hello world!" > hello.txt

main.i: main.c
	$(CPP) main.c > main.i

clean:
	rm -f main.i hello.txt

.PHONY: clean

main.s: main.i
	$(CC) -S main.i
	
whatever.s: whatever.c
	$(CC) -S whatever.c


%.o: %.s
	$(AS) $< -o $@