-- Exercise 11.2

-- You need to run it on a shell, because it requires arguments
-- lua exercise11_2.lua <file to sort> <rejected word list> <first n-entries to display>
-- lua exercise11_2.lua words.txt reject.txt 4

--[[
    Repeat the previous exercise(exercise11_1.lua) but, instead of using length as the criterion for ignoring a word,
    the program should read from a text file a list of words to be ignored.
--]]



local sort = {}
local words = {}
local rejected = {}
local reject = io.open(assert(arg[2], "Specify your rejected file, with extension"), "r")
    for line in reject:lines() do
        for words in line:gmatch("%w+") do
            rejected[#rejected + 1] = words
        end
    end
assert(reject:close())

local file = io.open(assert(arg[1], "Invalid Format....Format: sortwords.lua <file> <number of entries>"), "r")
    for lines in file:lines() do
        for word in lines:gmatch("%w+") do
            for i = 1, #rejected do
                if word == rejected[i] then
                    sort[word] = nil
                else
                    sort[word] = (sort[word] or 0) + 1
                end
            end
        end
    end

    for _ in pairs(sort) do
        words[#words + 1] = _
    end
 table.sort(words, function(c1, c2)
    return (sort[c1] > sort[c2]) or sort[c1] == sort[c2] and c1 < c2
 end)
    for i = 1, assert(arg[3], "Number of entries to display must be a number") do
        print(i, words[i])
    end
