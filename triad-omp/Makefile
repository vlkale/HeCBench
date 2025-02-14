#===============================================================================
# User Options
#===============================================================================

# Compiler can be set below, or via environment variable
CC        = icpc
OPTIMIZE  = yes
DEBUG     = no
DEVICE    = gpu


#===============================================================================
# Program name & source code list
#===============================================================================

program = triad

source = main.cpp  Option.cpp  OptionParser.cpp  triad.cpp Timer.cpp

obj = $(source:.cpp=.o)

#===============================================================================
# Sets Flags
#===============================================================================

# Standard Flags
CFLAGS := -std=c++14 -Wall

# Linker Flags
LDFLAGS = 

# Debug Flags
ifeq ($(DEBUG),yes)
  CFLAGS += -g
  LDFLAGS  += -g
endif


# Optimization Flags
ifeq ($(OPTIMIZE),yes)
  CFLAGS += -O3
endif

ifeq ($(DEVICE),gpu)
  CFLAGS +=-qnextgen -fiopenmp -fopenmp-targets=spir64 -D__STRICT_ANSI__
else
  CFLAGS +=-qopenmp
endif
#===============================================================================
# Targets to Build
#===============================================================================

$(program): $(obj) Makefile
	$(CC) $(CFLAGS) $(obj) -o $@ $(LDFLAGS)

main.o: main.cpp OptionParser.h Utility.h 
	$(CC) $(CFLAGS) -c $< -o $@

Option.o: Option.cpp Option.h 
	$(CC) $(CFLAGS) -c $< -o $@

OptionParser.o: OptionParser.cpp OptionParser.h  Utility.h
	$(CC) $(CFLAGS) -c $< -o $@

triad.o: triad.cpp Timer.h OptionParser.h 
	$(CC) $(CFLAGS) -c $< -o $@

Timer.o: Timer.cpp Timer.h config.h  
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(program) $(obj)

run: $(program)
	./$(program) --passes 100 

