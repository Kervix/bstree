CC = gcc
CFLAGS = -Wall -Wextra -g

TARGET = test
SRCS = test.c bstree.c
OBJS = $(SRCS:.c=.o)
VALGRIND = valgrind

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	$(VALGRIND) ./$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
