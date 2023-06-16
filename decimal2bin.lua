-- A function to convert any binary number, to its decimal equivalence (not recursively)


local function dec2bin(bin)
    local length = #tostring(bin)
    local result = 1
        if (bin == 0 or bin == 1) then
            return bin
        end
        if( tostring(bin):match("[^10]") ) then
            return "Invalid Binary Number!"
        end
        for i = 1, length - 1 do
            result = result  + (2^i * tonumber(string.sub(bin, i, i))) 
        end 
    return result | 0  -- Converting it to an integer
end

print(dec2bin(1111))  --|> 15
