CC = gcc
CFLAGS = -I include -g
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
	mkdir bin
	mv ./hm bin/hm

clean:
	rm -rf *.o src/*.o $(EXEC)
