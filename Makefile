CC = gcc
CFLAGS = -I include -g -std=c11
SRC = $(wildcard *.c src/*.c)
HEAD = $(wildcard include/*.h)
OBJ = $(SRC:.c=.o)
EXEC = hm
WIN_EXEC=hm.exe

all: clean $(OBJ) $(EXEC) $(HEAD)

$(EXEC): $(OBJ)
	$(CC) $^ -o $@
	$(CC) $^ -o hm.exe

%.o: %.cpp
	$(CC) $(CFLAGS) $^ -o $@

build:
	make
	mv ./hm bin/hm
	mv ./hm.exe bin/hm.exe
	cd bin
	zip hm.zip ./hm
	zip windows.zip ./hm.exe
	cd ..
	make clean

install:
	chmod +x install.sh
	./install.sh

clean:
	rm -rf *.o src/*.o $(EXEC) hm.exe
