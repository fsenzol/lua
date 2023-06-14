-- Checks if a word is palindrome!

local function isPalindrome(str)
    local str1 = str:gsub('[%p%s]','') -- removes any punctuations or whitespaces
        if string.reverse(str1) == str1 then 
            return true
        else 
            return false
        end
    end

print(isPalidome("madam")) -- true
