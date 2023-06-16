-- A recursive version of the decimal to binary converter


local function dec2bin(bin, counter)
    counter = counter or (#tostring(bin) - 1)
        if bin == 0 or bin == 1 then
            return bin
        end
        if counter == 1 then
            return tonumber(string.sub(bin, -counter, -counter))
        end
    return dec2bin(bin, counter - 1) + 2 ^ (counter) + tonumber(string.sub(bin, -counter, -counter))
end

print(dec2bin(1111)) --> 15