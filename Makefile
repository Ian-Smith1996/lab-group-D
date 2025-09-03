hello.txt:
	echo "hello world!" > hello.txt

main.i: main.c
	$(CPP) main.c > main.i