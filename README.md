# inf_arith - Infinite Precision Arithmetic Calculator

## Overview

**inf_arith** is a C++ library that provides unlimited precision arithmetic operations for both integers and floating-point numbers. Unlike standard data types that have limitations on size and precision, this library uses string-based representations to perform calculations without any numerical bounds.

## Features

### Core Capabilities
- **Unlimited Precision**: Perform calculations with numbers of arbitrary length without overflow limitations
- **String-Based Implementation**: Uses string representations internally to handle numbers beyond standard data type limits
- **Dual Data Types**: Supports both integer and floating-point arithmetic

### Supported Operations
- **Basic Arithmetic**: Addition, subtraction, multiplication, and division
- **Unary Operations**: Negation operator for both integers and floats
- **Comparison Operations**: Less-than operator for integer comparisons
- **Type Conversion**: Parse strings into Integer or Float objects

### Advanced Features
- **Automatic Formatting**: Eliminates leading zeros, handles negative zero cases, and formats floating-point numbers correctly
- **Namespace Organization**: All classes are contained within the `InfiniteArithmetic` namespace to prevent naming conflicts
- **Stream Output**: Overloaded `<<` operator for easy printing of results

## Project Structure

```
inf_arith/
├── main.cpp          # Command-line interface and usage examples
├── calc.h            # Header file with class declarations
├── calc.cpp          # Implementation of all arithmetic operations
├── Makefile          # Build configuration
└── Report.pdf        # Project documentation
```

## Installation and Building

### Prerequisites
- C++ compiler with C++11 or later support
- Make utility (optional, for using Makefile)

### Build Instructions

**Method 1: Using Makefile**
```bash
# Build the main executable
make all

# Build as a static library
make libmy_inf_arith

# Clean build artifacts
make clean
```

**Method 2: Manual Compilation**
```bash
# Compile the main program
g++ main.cpp -o my_inf_arith

# Or compile as a library
g++ calc.cpp -o my_inf_arith.o
ar rcs libmy_inf_arith.a my_inf_arith.o
```

## Usage

### Command Line Interface
The program accepts command-line arguments in the following format:
```bash
./my_inf_arith [type] [operation] [operand1] [operand2]
```

**Examples:**
```bash
# Integer operations
./my_inf_arith int add 123456789012345678901234567890 987654321098765432109876543210
./my_inf_arith int sub 1000000000000000000000000000000 1
./my_inf_arith int mul 999999999999999999999999999999 999999999999999999999999999999
./my_inf_arith int div 123456789012345678901234567890 123456789

# Float operations
./my_inf_arith float add 123.456789012345678901234567890 987.654321098765432109876543210
./my_inf_arith float sub 1000.0000000000000000000000000 0.0000000000000000000000001
./my_inf_arith float mul 3.14159265358979323846264338327 2.71828182845904523536028747135
./my_inf_arith float div 22.0000000000000000000000000000 7.0000000000000000000000000000
```

### Library Integration

**Include the library in your C++ project:**
```cpp
#include "calc.h"
using namespace InfiniteArithmetic;

int main() {
    // Integer operations
    Integer a("123456789012345678901234567890");
    Integer b("987654321098765432109876543210");
    Integer sum = a + b;

    // Float operations
    Float x("3.14159265358979323846264338327");
    Float y("2.71828182845904523536028747135");
    Float product = x * y;

    // Output results
    std::cout << "Sum: " << sum << std::endl;
    std::cout << "Product: " << product << std::endl;

    return 0;
}
```

## Class Reference

### Integer Class
The `Integer` class handles unlimited precision integer arithmetic.

**Constructors:**
- `Integer()` - Default constructor (initializes to 0)
- `Integer(const string s)` - Construct from string representation
- `Integer(const Integer &given)` - Copy constructor

**Operators:**
- `+`, `-`, `*`, `/` - Basic arithmetic operations
- `<` - Less-than comparison
- Unary `-` - Negation
- `<<` - Stream output

**Methods:**
- `val()` - Returns the string representation
- `parse(string s)` - Static method to create Integer from string

### Float Class
The `Float` class handles unlimited precision floating-point arithmetic.

**Constructors:**
- `Float()` - Default constructor (initializes to 0.0)
- `Float(const string s)` - Construct from string representation
- `Float(const Float &given)` - Copy constructor

**Operators:**
- `+`, `-`, `*`, `/` - Basic arithmetic operations
- Unary `-` - Negation
- `<<` - Stream output

**Methods:**
- `val()` - Returns the string representation
- `parse(string s)` - Static method to create Float from string

## Implementation Details

### String Processing
Both classes implement sophisticated string processing to handle:
- **Leading Zero Removal**: Automatically removes unnecessary leading zeros
- **Negative Zero Handling**: Converts "-0" to "0" automatically
- **Decimal Point Management**: Ensures proper decimal point placement and formatting
- **Trailing Zero Elimination**: Removes unnecessary trailing zeros in float representations

### Arithmetic Algorithms
The library implements custom algorithms for:
- **Addition**: Digit-by-digit addition with carry propagation
- **Subtraction**: Handles borrowing across multiple digits
- **Multiplication**: Uses grade-school multiplication algorithm adapted for strings
- **Division**: Implements long division algorithm for both integers and floats

### Memory Management
- **Efficient String Handling**: Uses C++ string class for dynamic memory management
- **Copy Semantics**: Proper copy constructors and assignment operators
- **Destructor**: Clean resource deallocation

## Performance Considerations

- **Time Complexity**: Operations scale with the number of digits in the operands
- **Space Complexity**: Memory usage is proportional to the size of the numbers being processed
- **Optimization**: The library prioritizes correctness over speed, making it suitable for applications requiring exact precision rather than high-performance computing

  
## Contributing

To contribute to this project:
1. Fork the repository
2. Create a feature branch
3. Implement your changes with proper testing
4. Submit a pull request with a clear description of your modifications

## License

This project is available as open source. Please refer to the repository for specific licensing terms.

## Future Enhancements

Potential areas for improvement:
- **Performance Optimization**: Implement more efficient algorithms for large numbers
- **Additional Operations**: Add support for modular arithmetic, power operations, and mathematical functions
- **Error Handling**: Enhanced error checking and exception handling
- **Thread Safety**: Make the library thread-safe for concurrent applications
- **Serialization**: Add support for binary serialization of large numbers

---
