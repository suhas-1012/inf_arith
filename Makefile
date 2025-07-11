# Compiler settings
CXX      := g++
CXXFLAGS := -Wall -std=c++11

# Target executable
TARGET   := my_inf_arith

# Source and object files
SRCS     := main.cpp calc.cpp
OBJS     := $(SRCS:.cpp=.o)

# Default build
all: $(TARGET)

# Link step
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile step
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

# Clean up
clean:
	rm -f $(OBJS) $(TARGET)
