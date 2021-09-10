# Chapter2 Types and Values

**Lua has no type definitions, each value carries its own type**<br>
There are eight basic types:
* nil 
* boolean 
* number 
* string 
* userdata
* function
* thread
* table

```lua
print(type("Hello world"))  --> string
print(type(10.4*3))         --> number
print(type(print))          --> function
print(type(type))           --> function
print(type(true))           --> boolean
print(type(nil))            --> nil
print(type(type(X)))        --> string
```

## nil
**Lua uses nil as a kind of non-value whose main property is to be different from any other value**

## Booleans
The boolean type has two values, false and true. In Lua, any value may represent a condition<br>
Conditionals (such as the ones in control structures) consider false and nil as false and anything else as true<br>
**unlike some other scripting languages, Lua considers both zero and the empty string as true in conditional tests**

## Numbers
The number type represents real (double-precision floating-point) numbers. Lua has no integer type as it does not need it.
Moreover, most modern CPUs do floating-point arithmetic as fast as (or even faster than) integer arithmetic.

## Strings
**a sequence of characters**<br>
Strings in Lua are immutable values. You cannot change a character inside a string. (Hash)<br>
instead, you create a new string with the desired modifications:

```lua
a = "one string"
b = string.gsub(a, "one", "another");
print(a) --> one string
print(b) --> another string

print("one line\nnext line\n\"in quotes\", 'in quotes'")
-- one line
-- next line
-- "in quotes", 'in quotes'
```

* Lua provides automatic conversions between numbers and strings at run time
* Any numeric operation applied to a string tries to convert the string to a number

```lua
print("10" + 1)           --> 11
print("10 + 1")           --> 10 + 1
print("-5.3e-10"*"2")     --> -1.06e-09
```


## Tables
Tables in Lua are neither values nor variables; they are objects.<br>
We use tables to represent **ordinary arrays, symbol tables, sets, records, queues, and global variables. and other data structures**, in a simple, uniform, and efficient way. Lua uses tables to represent **packages** as well. 

```lua
a = {}  -- create a table and store its reference in 'a'
k = "x"
a[k] = 10
a[20] = "great"
```

You may think of a table as a dynamically allocated object; 
your program only manipulates references (or pointers) to them. 
There are no hidden copies or creation of new tables behind the scenes. 
Moreover, you do not have to declare a table in Lua; in fact, there is no way to declare one.

### IMPORTANT: A table is always anonymous

```lua
b = a  -- b refers to the same table as a
a = nil;  -- now only b still refers to the table
b = nil;  -- now there are no references left to the table
-- When a program has no references to a table left, Lua memory management will eventually delete the table and reuse its memory
```

Difference between a.x and a[x]:<br>
* **a.x refers to a table indexed with string x**
* **a[x] refers to a table indexed with variable x**

```lua
a = {}
x = "y"
a[x] = 10                 -- put 10 in field "y"
print(a[x])   --> 10      -- value of field "y"
print(a.x)    --> nil     -- value of field "x" (undefined)
print(a.y)    --> 10      -- value of field "y"
```

### Table iteration

```c
a = {}
a[12] = 12;
for i=1,10 do
  a[i] = 10
end
a["s"] = "JKL"

-- print the lines
for i, line in ipairs(a) do   -- pairs() := all elements
    -- ipairs() := all integer elements (indexes must be continuous)
    print(i)    -- print indexes
    print(line) -- print value
end

for i, line in pairs(a) do   -- pairs() := all elements
    print(i)    -- print indexes
    print(line) -- print value
end
```


## Functions
Functions are first-class values in Lua.<br>
That means that functions can be **stored in variables, passed as arguments to other functions, and returned as results**.

**Lua can call functions written in Lua and functions written in C. All the standard library in Lua is written in C.**

## Userdata
The userdata type allows arbitrary C data to be stored in Lua variables. It has no predefined operations in Lua, except assignment and equality test. Userdata are used to represent new types created by an application program or a library written in C


> **Reference**<br>
> **[Programming in Lua Chapter2](https://www.lua.org/pil/2.html)**

