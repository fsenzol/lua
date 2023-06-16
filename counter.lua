-- A function that increments a counter, whenever called

local function counter()
    local counter = 0
        return function()
            counter = counter + 1
            return counter
        end
end

local instance1 = counter()
local instance2 = counter()
local instance3 = counter()

print( instance1() )
print( instance1() )
print( instance2() )
print( instance2() )
print( instance3() )
print( instance2() )