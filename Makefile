.PHONY:clean build all

EMULATOR = x86

CC = clang++

#G++_OPTIONS = -std=c++11 -g -O0 -I $(INCLUDE_DIR) -DDEBUG
G++_OPTIONS = -std=c++11 -g -O0 -I $(INCLUDE_DIR)


SOURCE_DIR      = ./src/
INCLUDE_DIR     = ./include/

HEADERS = $(wildcard $(INCLUDE_DIR)*.h)
SOURCES = $(wildcard $(SOURCE_DIR)*.cpp)
OBJECTS = $(SOURCES:.cpp=.o)

all:$(EMULATOR)

%.o : %.cpp $(HEADERS)
	$(CC) $(G++_OPTIONS) -o $@ -c $<

$(EMULATOR) : $(OBJECTS) 
	$(CC) $(LD_FLGS) -o $(OUTPUTS_DIR)$(EMULATOR) $^ 

clean :
	rm $(OUTPUTS_DIR)$(EMULATOR)
	rm $(SOURCE_DIR)*.o
