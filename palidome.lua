-- Checks if a word is palidome

local function isPalidome(str)
    local str1 = str:gsub('[%p%s]','') -- removes any punctuations or whitespaces
        if string.reverse(str1) == str1 then 
            return true
        else 
            return false
        end
    end

print(isPalidome("madam")) -- true
