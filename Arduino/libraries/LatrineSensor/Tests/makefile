# ==========================================
#   Unity Project - A Test Framework for C
#   Copyright (c) 2007 Mike Karlesky, Mark VanderVoord, Greg Williams
#   [Released under MIT License. Please refer to license.txt for details]
# ========================================== 

C_COMPILER=g++

TEST_NAME=LatrineSensor

TARGET = $(TEST_NAME)

SRC_FILES=$(UNITY_FOLDER)/src/unity.c ../$(TEST_NAME).cpp $(TEST_NAME)_test.cpp $(TEST_NAME)_test_Runner.c

INC_DIRS= -I../ -I$(UNITY_FOLDER)/src

SYMBOLS=-DUNITY_TEST -Wall -Wextra

.PHONY: all

all: 
	$(C_COMPILER) $(INC_DIRS) $(SYMBOLS) $(SRC_FILES) -o $(TARGET)
	./$(TARGET)
