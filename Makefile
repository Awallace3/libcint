include ../make.in

SRC = $(wildcard *.c)
CFLAGS = -O3 -Wall -w2 -openmp
CFLAGS += -Wunknown-pragmas -Wunused-variable
CFLAGS += ${OPTFLAGS}
CFLAGS += -D__ALIGNLEN__=${alignlen}

ifeq "${arch}" "hetero"
CFLAGS += -offload-option,mic,compiler,"-z defs -no-opt-prefetch"
else
CFLAGS += -D__ERD_PROFILE__ -offload=none -diag-disable 161,2423
endif

ifeq "${arch}" "mic"
LIBCINT = libcint_mic.a
OBJS0 := $(addsuffix .o, $(basename $(SRC)))
OBJS := $(addprefix mic/, $(OBJS0))
CFLAGS += -no-opt-prefetch 
else
LIBCINT = libcint.a
OBJS := $(addsuffix .o, $(basename $(SRC)))
endif

all: ${LIBCINT}

${LIBCINT}: ${OBJS}
	${AR} $@ $^
	cp -r $@ ../lib/
	sh genheader.sh

%.o : %.c Makefile
	$(CC) ${CFLAGS} ${INC} -c $< -o $@ 

mic/%.o : %.c Makefile
	$(CC) ${CFLAGS} ${INC} -c $< -o $@

clean:
	rm -f *.o mic/*.o *.s *.d *~ *.a
