-- Relational Operators
-- 1. If the values have different types, Lua considers them different values.
-- 2. Lua compares tables, userdata, and functions by reference

a = {}; a.x = 1; a.y = 0;
b = {}; b.x = 1; b.y = 0;
c = a;

print(a == b) -- false
print(a == c) -- true

-- Logical Operators
-- all logical operators consider false and nil as false and anything else as true.


-- Concatenation
-- Lua denotes the string concatenation operator by ".." (two dots).
-- If any of its operands is a number, Lua converts that number to a string.
-- Strings in Lua are immutable values, just creates a new string
print("Hello " .. "World")  --> Hello World
print(0 .. 1)               --> 01

-- Table Constructors

opnames = {["+"] = "add", ["-"] = "sub",
               ["*"] = "mul", ["/"] = "div"}

xy1 = {x=1, y=0}
xy2 = {["x"]=1, ["y"]=0}

print(xy1.x) --> 1
print(xy2.x) --> 1
-- xy1 and xy2 are the same

color1 = {"red", "green", "blue"}
color2 = {[1]="red", [2]="green", [3]="blue"}
-- color1 and color2 are the same

table = {x=10, y=45; "one", "two", "three"}
print(table[1]); --> one



polyline = {color="blue", thickness=2, npoints=4,
	     {x=0,   y=0, {z=10, i=19}, {j=21}},
	     {x=10, y=0},
	     {x=-10, y=1},
	     {x=0,   y=1}
	   }
print(polyline.color) --> blue
print(polyline[2].x)  --> 10
print(polyline[1][1].i) --> 19
