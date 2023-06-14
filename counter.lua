-- A function that increments a counter, whenever called

local function counter()
    local counter = 0
        return function()
            counter = counter + 1
            return counter
        end
end

local counter = counter()
print(counter()) --> 1
counter()
print(counter()) --> 3 