CC = gcc
CFLAGS = -I include -g -std=c11
SRC = $(wildcard *.c src/*.c)
HEAD = $(wildcard include/*.h)
OBJ = $(SRC:.c=.o)
EXEC = hm

all: clean $(OBJ) $(EXEC) $(HEAD)

$(EXEC): $(OBJ)
	$(CC) $^ -o $@

%.o: %.cpp
	$(CC) $(CFLAGS) $^ -o $@

build:
	make
	mv ./hm bin/hm
	make clean

clean:
	rm -rf *.o src/*.o $(EXEC)
