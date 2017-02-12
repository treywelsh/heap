CFLAGS ?= -Wall -Wextra
LDFLAGS ?=
CC ?= gcc
DEBUG ?= 0
STATIC ?= 0

BIN = heap_test
SRC = heap.c main.c
OBJ = $(SRC:.c=.o)

#Mandatory flags
CFLAGS += -fstrict-aliasing

ifeq ($(DEBUG), 1)
	CFLAGS += -DDEBUG -O0 -g -fno-inline
else
	CFLAGS += -DNDEBUG -O3 -march=native
endif

ifeq ($(STATIC), 1)
	LDFLAGS += -static
endif

all: $(BIN)

$(BIN) : $(OBJ)
	$(CC) -o $(BIN) $(OBJ) $(LDFLAGS) $(CFLAGS)

%.o : %.c
	$(CC) $(CFLAGS) -o $@ -c $<

clean :
	@rm -f $(OBJ) $(BIN)
