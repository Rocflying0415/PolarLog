CC = gcc
CXX = g++ -std=c++11

SOURCE_FILES = $(filter-out ./src/main.cpp, $(wildcard ./src/*.cpp))
HEARDER_FILES = $(wildcard ./include/*.h)
OBJECT_FILES = $(patsubst %.cpp, %.o, $(SOURCE_FILES))

HEARDER_DIRS = ./include/
LIBS = -lstdc++ -lpthread -ldl
CXXFLAGS = -g -Wall -O0 -fPIC -fno-strict-aliasing -fno-omit-frame-pointer

TARGET_FIEL = polarlog_main
TARGET_LIB = ./lib/libpolarlog.a
AR_TOOL = ar -r



all : $(TARGET_LIB)
	@echo "===source_files====\n"
	@echo $(SOURCE_FILES)

$(TARGET_LIB) : $(OBJECT_FILES)
	$(AR_TOOL) $(TARGET_LIB) $(OBJECT_FILES)

$(TARGET_FIEL) : $(OBJECT_FILES)
	$(CC) -I$(HEARDER_DIRS) $(LIBS) $(OBJECT_FILES) ./src/main.cpp -o $@

%.o : %.cpp
	$(CXX) $(CXXFLAGS) -I$(HEARDER_DIRS) $(LIBS) -c $< -o $@

clean :
	rm -rf $(OBJECT_FILES)
	#rm $(TARGET_FIEL)
	rm -rf ./log
