BIN = EDIT

OBJDIR = ./obj
BINDIR = ./bin
INCDIR = ./include
SRCDIR = ./src

#OBJECTS = ${OBJDIR}/test.o ${OBJDIR}/main.o
SRCES = $(notdir $(wildcard $(SRCDIR)/*.c))
OBJES = $(patsubst %.c,$(OBJDIR)/%.o,$(SRCES))
PARA_ES = $(notdir $(wildcard $(SRCDIR)/*.json))
PARAES = $(patsubst %.json,$(BINDIR)/%.json,$(PARA_ES))


$(warning $(OBJES))

CFLAGS = -g -O0
LDFLAGS = -lpthread
CC = gcc 
#-${CCFLAG}
# ${BINDIR} ${OBJDIR}


${BINDIR}/$(BIN):$(OBJES) $(PARAES)#生成目标文件
	${CC} $(CFLAGS) -o $@ -I${INCDIR} $(OBJES)  $(LDFLAGS)


$(OBJDIR)/%.o :${SRCDIR}/%.c
	${CC} -o $@ $(CFLAGS) -c -I${INCDIR} $<

$(BINDIR)/%.json :$(SRCDIR)/%.json
	cp -rf $< $@



# ${OBJDIR}/test.o:${SRCDIR}/test.c
# 	${CC} -o ${OBJDIR}/test.o -c -I${INCDIR} ${SRCDIR}/test.c

# ${BINDIR}:
# 	@test -d ${BINDIR} || mkdir ${BINDIR}

# ${OBJDIR}:
# 	@test -d ${OBJDIR} || mkdir ${OBJDIR}

.PHONY: clean
clean:
	rm -rf ${OBJDIR}/* ${BINDIR}/*


