
-- Functions can both 1.carry out a specific task -> statement
-- or 2.compute and return values. -> expression

-- if the function has one single argument and this argument is either a literal string or a table constructor
-- then the parentheses are optional:
 print "Hello World"
 print("Hello, World")

-- Functions used by a Lua program can be defined both in Lua and in C
-- When calling a function, there is no difference between functions defined in Lua and functions defined in C.

-- add all elements of array  'a'
local function add (a)
    local sum = 0
    for i, v in ipairs(a) do
    	sum = sum + v
    end
    return sum
end

local para = {1, 2, 3, 4}
print(add(para))  --> 10


s, e = string.find("hello Lua users", "Lua")

print(s, e)   -->  7      9

-- a function example:
function maximum (a)
  local mi = 1          -- maximum index
  local m = a[mi]       -- maximum value
  for i,val in ipairs(a) do
    if val > m then
      mi = i
      m = val
    end
  end
  return m, mi
end

print(maximum({8,10,23,12,5}))     --> 23   3

-- Variable Number of Arguments
printResult = ""

function store (...)
  for i,v in ipairs(arg) do
    printResult = printResult .. tostring(v) .. "\t"
  end
  printResult = printResult .. "\n"
end

-- The three dots (...) in the parameter list indicate that the function has a variable number of arguments.
-- When this function is called, all its arguments are collected in a single table, 
-- which the function accesses as a hidden parameter named arg.

print(string.find("hello hello", " hel"))         --> 6  9
print(select(1, string.find("hello hello", " hel"))) --> 6
print(select(2, string.find("hello hello", " hel"))) --> 9
