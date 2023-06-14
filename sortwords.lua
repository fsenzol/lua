   -- A simple program, to sort words in a file, with preference to the highest occurring words

    local sort = {}
    local words = {}
    local file = io.open(assert(arg[1], "Invalid Format....Format: sortwords.lua <file> <number of entries>"), "r")
        for lines in file:lines() do
            for word in lines:gmatch("%w+") do
                sort[word] = (sort[word] or 0) + 1
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

