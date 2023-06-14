-- Checks if a word is palindrome!

local function isPalindrome(str)
    local str1 = str:gsub('[%p%s]',''):lower() -- removes any punctuations or whitespaces
        if string.reverse(str1) == str1 then 
            return true
        else 
            local text = {}
                for i = 1, #str1 do
                    text[#text + 1] = string.sub(str1, -i,-i)
                end
                text = table.concat(text)
                if(str1 == text ) then
                    return true
                else
                    return false
                end
        end
    end

print(isPalindrome("Sit on a potato pan, Otis.")) -- true
