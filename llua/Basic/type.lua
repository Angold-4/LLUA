-- Lua has no type definitions, each value carries its own type
--
-- There are eight basic types:
-- nil, boolean, number, string, userdata, function, thread, and table

print(type("Hello world"))  --> string
print(type(10.4*3))         --> number
print(type(print))          --> function
print(type(type))           --> function
print(type(true))           --> boolean
print(type(nil))            --> nil
print(type(type(X)))        --> string

-- nil:
-- Lua uses nil as a kind of non-value whose main property is to be different from any other value
--
-- Booleans:
-- The boolean type has two values, false and true. In Lua, any value may represent a condition
-- Conditionals (such as the ones in control structures) consider false and nil as false and anything else as true
-- ! unlike some other scripting languages, Lua considers both zero and the empty string as true in conditional tests
--
-- Numbers:
-- The number type represents real (double-precision floating-point) numbers. Lua has no integer type, as it does not need it.
-- Moreover, most modern CPUs do floating-point arithmetic as fast as (or even faster than) integer arithmetic.
--
-- Strings:
-- a sequence of characters
-- Strings in Lua are immutable values. You cannot change a character inside a string. (Hash)
-- instead, you create a new string with the desired modifications:

a = "one string"
b = string.gsub(a, "one", "another");
print(a) --> one string
print(b) --> another string

print("one line\nnext line\n\"in quotes\", 'in quotes'")
-- one line
-- next line
-- "in quotes", 'in quotes'

-- Lua provides automatic conversions between numbers and strings at run time
-- Any numeric operation applied to a string tries to convert the string to a number
print("10" + 1)           --> 11
print("10 + 1")           --> 10 + 1
print("-5.3e-10"*"2")     --> -1.06e-09


-- Tables:
-- Tables in Lua are neither values nor variables; they are objects.
-- We use tables to represent ordinary arrays, symbol tables, sets, records, queues, and *global variables.
-- and other data structures, in a simple, uniform, and efficient way. Lua uses tables to represent packages as well. 
a = {}  -- create a table and store its reference in 'a'
k = "x"
a[k] = 10
a[20] = "great"

-- You may think of a table as a dynamically allocated object; 
-- your program only manipulates references (or pointers) to them. 
-- There are no hidden copies or creation of new tables behind the scenes. 
-- Moreover, you do not have to declare a table in Lua; in fact, there is no way to declare one.
--
-- IMPORTANT: A table is always anonymous.
b = a  -- b refers to the same table as a
a = nil;  -- now only b still refers to the table
b = nil;  -- now there are no references left to the table
-- When a program has no references to a table left, Lua memory management will eventually delete the table and reuse its memory

-- diff between a.x and a[x]:
-- a.x refers to a table indexed with string x
-- a[x] refers to a table indexed with variable x
a = {}
x = "y"
a[x] = 10                 -- put 10 in field "y"
print(a[x])   --> 10      -- value of field "y"
print(a.x)    --> nil     -- value of field "x" (undefined)
print(a.y)    --> 10      -- value of field "y"

-- table iteration:

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



