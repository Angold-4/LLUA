function fact (n)
    if n == 0 then 
	return 1
    else
	return n * fact(n-1)
    end
end

print("enter a number:")
a = io.read("num") -- any string is okay (maybe)
print(fact(a))
