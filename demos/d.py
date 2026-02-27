#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Comprehensive Python syntax test file
Contains all major syntax elements for testing syntax highlighting
"""

# =========== 1. Module and Package Imports ===========
import os
import sys
import re
from datetime import datetime, timedelta
from typing import List, Dict, Tuple, Optional, Union, Callable, Any
from collections import defaultdict, Counter
import numpy as np
import pandas as pd  # Third-party library import
from . import local_module  # Relative import

# =========== 2. Variables and Basic Types ===========
# Basic variables
global_var = "I am a global variable"
CONSTANT_VAR = 3.141592653589793  # Constant
counter = 0
flag = True
nothing = None

# Various numeric types
integer = 42
float_num = 3.14
complex_num = 2 + 3j
binary_num = 0b1010
octal_num = 0o755
hex_num = 0xFF

# String types
single_quotes = 'Single-quoted string'
double_quotes = "Double-quoted string"
triple_quotes = """Triple-quoted string
can span multiple lines"""
raw_string = r"Raw string \n does not escape"
f_string = f"Formatted string: {integer}"
b_string = b"Byte string"
u_string = u"Unicode string"

# Collection types
my_list = [1, 2, 3, "Mixed types", True]
my_tuple = (1, "Tuple", 3.14)
my_dict = {"key": "value", "number": 123, "list": [1, 2, 3]}
my_set = {1, 2, 3, 3, 2}  # Duplicate elements will be removed

# =========== 3. Control Flow Statements ===========
# if/elif/else statements
def control_flow_example(x: int) -> str:
    """Control flow example function"""
    if x > 100:
        result = "Greater than 100"
    elif x > 50:
        result = "Greater than 50"
    elif x > 0:
        result = "Positive number"
    elif x == 0:
        result = "Zero"
    else:
        result = "Negative number"
    
    return result

# for loop
for i in range(10):
    if i % 2 == 0:
        continue  # Skip even numbers
    print(f"Odd number: {i}")

# while loop
n = 5
while n > 0:
    print(f"Countdown: {n}")
    n -= 1
    if n == 2:
        break  # Exit loop early

# List comprehension
squares = [x**2 for x in range(10) if x % 2 == 0]
nested_comprehension = [(x, y) for x in range(3) for y in range(3)]

# Dictionary comprehension
square_dict = {x: x**2 for x in range(5)}
# Set comprehension
unique_lengths = {len(x) for x in ["apple", "banana", "cherry"]}

# =========== 4. Function Definitions ===========
def simple_function(param1, param2=10):
    """Simple function docstring"""
    return param1 + param2

def type_annotated_func(
    name: str, 
    age: int, 
    scores: List[float]
) -> Dict[str, Any]:
    """
    Function with type annotations
    
    Args:
        name: User name
        age: User age
        scores: List of scores
    
    Returns:
        Dictionary containing user information
    """
    return {
        "name": name,
        "age": age,
        "avg_score": sum(scores) / len(scores) if scores else 0,
        "timestamp": datetime.now()
    }

# Generator function
def fibonacci_generator(n: int):
    """Fibonacci sequence generator"""
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

# Async function
import asyncio
async def async_example(url: str):
    """Async function example"""
    import aiohttp
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return await response.text()

# Lambda expressions
add = lambda x, y: x + y
square = lambda x: x**2

# =========== 5. Class Definitions ===========
class BaseClass:
    """Base class"""
    class_var = "Class variable"
    
    def __init__(self, name: str):
        self.name = name  # Instance variable
        self._protected_var = "Protected variable"
        self.__private_var = "Private variable"
    
    def instance_method(self):
        """Instance method"""
        return f"Instance method: {self.name}"
    
    @classmethod
    def class_method(cls):
        """Class method"""
        return f"Class method: {cls.class_var}"
    
    @staticmethod
    def static_method():
        """Static method"""
        return "Static method"
    
    @property
    def name_property(self):
        """Property decorator"""
        return self.name
    
    @name_property.setter
    def name_property(self, value):
        self.name = value

class DerivedClass(BaseClass):
    """Derived class"""
    
    def __init__(self, name: str, extra: str):
        super().__init__(name)  # Call parent class initializer
        self.extra = extra
    
    def instance_method(self):
        """Override parent class method"""
        base_result = super().instance_method()
        return f"{base_result} + {self.extra}"
    
    def __str__(self):
        """Special method: string representation"""
        return f"DerivedClass(name={self.name}, extra={self.extra})"
    
    def __add__(self, other):
        """Special method: addition operation"""
        if isinstance(other, DerivedClass):
            return DerivedClass(
                f"{self.name}+{other.name}",
                f"{self.extra}+{other.extra}"
            )
        return NotImplemented

# =========== 6. Exception Handling ===========
def exception_example(filename: str):
    """Exception handling example"""
    try:
        with open(filename, 'r') as f:
            content = f.read()
        result = int(content)
    except FileNotFoundError as e:
        print(f"File not found: {e}")
        result = None
    except ValueError as e:
        print(f"Value error: {e}")
        result = 0
    except Exception as e:
        print(f"Unknown error: {e}")
        raise  # Re-raise exception
    else:
        print("File read successfully")
    finally:
        print("Cleanup operation")
    
    return result

# Custom exception
class CustomError(Exception):
    """Custom exception class"""
    def __init__(self, message: str, code: int):
        super().__init__(message)
        self.code = code
    
    def __str__(self):
        return f"[Error code {self.code}] {super().__str__()}"

# =========== 7. Decorators ===========
def simple_decorator(func):
    """Simple decorator"""
    def wrapper(*args, **kwargs):
        print(f"Calling function: {func.__name__}")
        result = func(*args, **kwargs)
        print(f"Function {func.__name__} completed")
        return result
    return wrapper

def parametrized_decorator(prefix: str = "DEBUG"):
    """Parameterized decorator"""
    def decorator(func):
        def wrapper(*args, **kwargs):
            print(f"[{prefix}] Starting execution: {func.__name__}")
            result = func(*args, **kwargs)
            print(f"[{prefix}] Finished execution: {func.__name__}")
            return result
        return wrapper
    return decorator

# Class decorator
class ClassDecorator:
    """Class decorator"""
    def __init__(self, func):
        self.func = func
        self.call_count = 0
    
    def __call__(self, *args, **kwargs):
        self.call_count += 1
        print(f"Call #{self.call_count} of {self.func.__name__}")
        return self.func(*args, **kwargs)

# Using decorators
@simple_decorator
@parametrized_decorator("INFO")
@ClassDecorator
def decorated_function(x: int) -> int:
    """Decorated function"""
    return x * 2

# =========== 8. Context Managers ===========
class CustomContextManager:
    """Custom context manager"""
    def __init__(self, name: str):
        self.name = name
    
    def __enter__(self):
        print(f"Entering context: {self.name}")
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f"Exiting context: {self.name}")
        if exc_type:
            print(f"Exception occurred: {exc_type.__name__}: {exc_val}")
        return False  # Do not suppress exception

# Using context manager
with CustomContextManager("test") as cm:
    print(f"Working in context: {cm.name}")
    # raise ValueError("Test exception")  # Uncomment to test exception

# =========== 9. Type Hints and Generics ===========
from typing import TypeVar, Generic, Sequence, Mapping, Iterator

T = TypeVar('T')  # Type variable
K = TypeVar('K')  # Key type variable
V = TypeVar('V')  # Value type variable

class GenericContainer(Generic[T]):
    """Generic container class"""
    def __init__(self, value: T):
        self.value = value
    
    def get_value(self) -> T:
        return self.value
    
    def transform(self, func: Callable[[T], V]) -> 'GenericContainer[V]':
        return GenericContainer(func(self.value))

# Using generics
int_container = GenericContainer(42)
str_container = GenericContainer("hello")

# =========== 10. Async and Concurrency ===========
import concurrent.futures
import threading
import multiprocessing

# Thread lock
lock = threading.Lock()

def thread_safe_increment():
    """Thread-safe increment function"""
    global counter
    with lock:
        counter += 1
        return counter

# Multithreading example
def run_threads():
    with concurrent.futures.ThreadPoolExecutor(max_workers=3) as executor:
        futures = [executor.submit(thread_safe_increment) for _ in range(5)]
        results = [f.result() for f in concurrent.futures.as_completed(futures)]
    return results

# =========== 11. Metaprogramming ===========
# Dynamic class creation
DynamicClass = type('DynamicClass', (object,), {
    'x': 10,
    'get_x': lambda self: self.x
})

# Using exec
code_string = """
def dynamic_function(x):
    return x * 3
"""
exec(code_string, globals())

# =========== 12. Advanced Features ===========
# Slicing operations
my_list = list(range(10))
slice1 = my_list[2:5]     # Index 2 to 4
slice2 = my_list[::2]     # Every other element
slice3 = my_list[::-1]    # Reverse list
slice4 = my_list[5:1:-1]  # Reverse slice

# Unpacking operations
a, b, *rest = range(10)  # a=0, b=1, rest=[2,3,4,5,6,7,8,9]
first, *middle, last = range(10)

# Dictionary unpacking
dict1 = {'a': 1, 'b': 2}
dict2 = {'c': 3, 'd': 4}
merged_dict = {**dict1, **dict2}

# Walrus operator (Python 3.8+)
if (n := len(my_list)) > 5:
    print(f"List length {n} is greater than 5")

# Match statement (Python 3.10+)
def match_example(value):
    """Pattern matching example"""
    match value:
        case 0:
            return "Zero"
        case 1 | 2 | 3:
            return "Small number"
        case [x, y]:
            return f"List with two elements: {x}, {y}"
        case {"name": name, "age": age}:
            return f"Name: {name}, Age: {age}"
        case _:
            return "Other"

# =========== 13. Comments and Docstrings ===========
# Single line comment
# This is a single line comment

"""
This is a multi-line comment
It can span multiple lines
Typically used for module-level documentation
"""

class DocumentedClass:
    """
    A class with detailed documentation
    
    Attributes:
        attribute1: First attribute
        attribute2: Second attribute
    """
    
    def documented_method(self, param1: int, param2: str) -> bool:
        """
        Method with detailed documentation
        
        Args:
            param1: First parameter, must be integer
            param2: Second parameter, must be string
        
        Returns:
            Boolean indicating whether operation succeeded
        
        Raises:
            ValueError: Raised when parameter is invalid
            TypeError: Raised when parameter type is incorrect
        
        Examples:
            >>> obj = DocumentedClass()
            >>> obj.documented_method(1, "test")
            True
        """
        if not isinstance(param1, int):
            raise TypeError("param1 must be an integer")
        if param1 < 0:
            raise ValueError("param1 cannot be negative")
        return True

# =========== 14. Special Syntax ===========
# Chained comparison
x = 5
if 0 < x < 10:
    print("x is between 0 and 10")

# Ternary expression
result = "Positive" if x > 0 else "Non-positive"

# Pass statement
pass  # Do nothing

# Delete variable
del x

# Assertion
assert len(my_list) > 0, "List cannot be empty"

# =========== 15. Practical Usage Examples ===========
def process_data(
    data: List[Dict[str, Any]],
    filter_func: Optional[Callable] = None
) -> pd.DataFrame:
    """
    Process data and return DataFrame
    
    This is a comprehensive example using various Python syntax elements
    """
    try:
        # Filter data
        if filter_func:
            filtered_data = [item for item in data if filter_func(item)]
        else:
            filtered_data = data
        
        if not filtered_data:
            raise CustomError("No data to process", 1001)
        
        # Convert to DataFrame
        df = pd.DataFrame(filtered_data)
        
        # Add processing time column
        current_time = datetime.now()
        df['processed_at'] = current_time.strftime("%Y-%m-%d %H:%M:%S")
        
        # Use lambda for transformation
        df['id_squared'] = df.get('id', 0).apply(lambda x: x**2 if pd.notnull(x) else 0)
        
        return df
    
    except CustomError as e:
        print(f"Custom error: {e}")
        return pd.DataFrame()
    except Exception as e:
        print(f"Error processing data: {type(e).__name__}: {e}")
        raise

# =========== 16. Main Program Entry ===========
def main():
    """Main function"""
    print("=== Python Syntax Highlighting Test ===")
    
    # Test various syntax elements
    obj = DerivedClass("Test object", "Extra info")
    print(obj)
    
    # Test decorators
    print(decorated_function(21))
    
    # Test generator
    fib = list(fibonacci_generator(10))
    print(f"Fibonacci sequence: {fib}")
    
    # Test exceptions
    try:
        exception_example("non_existent_file.txt")
    except:
        pass
    
    # Test match statement
    test_cases = [0, 2, [1, 2], {"name": "Alice", "age": 30}, "other"]
    for case in test_cases:
        print(f"Match {case}: {match_example(case)}")
    
    print("=== Test completed ===")

if __name__ == "__main__":
    main()
