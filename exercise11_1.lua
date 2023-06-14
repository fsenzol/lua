-- Exercise 11.1

--[[ 
    When we apply the word-frequency(sortwords.lua) program to a text, usually the most frequent words
    are uninteresting small words like articles and prepositions. Change the program so that it ignores words
    with less than four letters. 
--]]


local sort = {}
local words = {}
local file = io.open(assert(arg[1], "Invalid Format....Format: sortwords.lua <file> <number of entries>"), "r")
    for lines in file:lines() do
        for word in lines:gmatch("%w+") do
            if #word > 4 then
                sort[word] = (sort[word] or 0) + 1
            end
        end
    end
    for _ in pairs(sort) do
        words[#words + 1] = _
    end
 table.sort(words, function(c1, c2)
    return (sort[c1] > sort[c2]) or sort[c1] == sort[c2] and c1 < c2
 end)
    for i = 1, assert(arg[2], "Number of entries must be a number") do
        print(i, words[i])
    end
