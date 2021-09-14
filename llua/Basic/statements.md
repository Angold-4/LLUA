# Chapter3 Statements

## Assignment

### multiple assignment

```lua
a, b = 10, 2
```

## Local Variables and Blocks
Besides global variables, Lua supports local variables. We create local variables with the **local statement:**<br>

```lua
g = 10       -- global variable
local l = 11 -- local variable
```

* local variables have their scope limited to the block where they are declared
* A block is the body of a control structure,
* the body of a function, or a **chunk (the file or string with the code where the variable is declared)**.

```lua
X = 10
local i = 1;
while i <= X do -- notice: i <= X, this X is a gloal variable (not inside the do-end block)
    local X = i*2
    print(X) -- 2, 4, 6, 8, 10, ...
    i = i + 1
end

i = 21
if i > 20 then --> inside the then scope
    local X
    X = 20
    print(X + 2) --> if i > 20: print 22
else
    print(X) --> if i <= 20: print 10
end
print(X) --> 10
```

**It is good programming style to use local variables whenever possible.**
1. Local variables help you **avoid cluttering** the global environment with unnecessary names
2. the access to local variables is **faster** than to global ones

```
foo = 10
if foo > 10 then
    local foo = foo --> preserve the gloal foo value and it is not a reference
    local p = 10
    print(p + foo)
end
```


## Control Structures

### if then else
**An if statement tests its condition and executes its then-part or its else-part accordingly. The else-part is optional.**
* **then part**
* **else part** (optional)

```lua
if a > 0 then a = 0 end

if a < b then a = a + 1 else b = b - 1 end

op = "/"
r = 0

if op == "+" then
  r = a + b
elseif op == "-" then
  r = a - b
elseif op == "*" then
  r = a*b
elseif op == "/" then
  r = a/b
else
  error("invalid operation")
end
```

### while
**lua first test the while conndition**

```lua
tb = {"jkl", "wu", 1, "wg"}
local i1 = 1
print(tb[i1])
while tb[i1] do
    print(tb[i1]) -- print  jkl wu 1 wg  line by line
    i1 = i1 + 1
end
```

### repeat
* **A repeat-until statement repeats its body until its condition is true.**
* **The test is done after the body, so the body is always executed at least once.**

```lua
-- print the first non-empty line
repeat
    line = io.read();
until line ~= ""
print(line)
```

### for

#### Numeric for

```lua
-- for var=expr1, expr2, expr3 do
--     something
-- end

local function f(x)
    return x
end

print("Numeric for:")
-- expr3 is optional, when absent, lua assumes one as the step value
local x = 10
for i2=1, f(x) do
    print(i2)
end

for i3=10, 1, -1 do
    print(i3)
end

-- find a value in a list
local lst = {n=4, "Jiawei", "Wang", 1110, 2001}
local value = 2001
local found = nil
for i4=1, lst.n do
    if lst[i4] == value then
	found = i4
	break
    end
end
print(found) --> 4
```


#### Generic for
**The generic for loop allows you to traverse all values returned by an iterator function.**

```lua
for i5, v5 in ipairs(lst) do print(i5, v5) end
-- output:
-- 1  Jiawei
-- 2  Wang
-- 3  1110
-- 4  2001

for i6, v6 in pairs(lst) do print(i6, v6) end
-- output:
-- 1  Jiawei
-- 2  Wang
-- 3  1110
-- 4  2001
-- n  4
```

* **`pairs()` returns key-value pairs and is mostly used for associative tables. key order is unspecified.**

* **`ipairs()` returns index-value pairs and is mostly used for numeric tables.** -- **Non numeric keys in an array are ignored, while the index order is deterministic (in numeric order).**


### Break and Return
* The break and return statements allow us to jump out from an inner block.
* There is an **implicit return** at the end of any function
* As other languages: it cannot be used outside a loop.
* After the **`break`**, the program continues running from the point immediately after the broken **loop**.

```lua
local a1 = {}
local i7 = 1
local v2 = 19
while a1[i7]==nil do
  a1[i7] = i7
  if a1[i7] == v2 then break end
  i7 = i7 + 1
end

print(a1[15]) -- 15
```

**For syntactic reasons, a `break` or `return` can appear only as the last statement of a block**<br>
**in other words, as the last statement in your chunk or just before an `end`, an `else`, or an `until`**

**Note: Inside a function and return immediately will cause a syntax error:**
```lua
function local foo() 
   return            -- syntax error
end
```
* **Sometimes, however, it may be useful to write a `return` (or a `break`) in the middle of a block**
* **for instance, if you are debugging a function and want to avoid its execution.<br>In such cases, you can use an explicit do block around the statement:**

```lua
local function foo()
    do return end  -- but this is correct
end
```
