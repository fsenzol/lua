-- A program to convert binary data/numbers to hexadecimal in lua :) obviously
-- Usage: print(bin2hex(1111)) --> 15 :)
local function bin2hex(bin)
    bin = tostring(bin)
    local result = ""
    local i = 0
        for w in bin:gmatch("%d%d%d%d") do
            if i == 16 then
                result = result.."\n"
            end
           result = result.." "..string.format("%02X", tonumber(w, 2))
           i = i + 1
        end
    return result
end
