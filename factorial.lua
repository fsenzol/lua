-- A simple factorial program in lua using recursion

local function factorial(n)
        if n == 0 then
            return 1
        end
        if n < 0 then 
            return nil
        end
    return n * factorial(n-1) 
end

io.write(factorial(3)) --> 6 
-- for arguments, io.write(factorial(arg[1])) <--> lua factorial.lua 3 --> 6 

 
