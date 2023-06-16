-- A program to display contents of a memory dump, in plain text, not a memory dumper itself
-- usage -> lua dumpbin.lua <absolute path to dumped memory file in binarry>
-- example -> lua dumpbin.lua binarydata.bin

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

local function hex2str(hex)
    hex = tostring(hex)
    local result = ""
        for str in hex:gmatch("%x%x") do
            result = result..(string.char(string.format("%d", tonumber(str, 16))))
        end
    return result
end

local argument = assert(arg[1], "Invalid File")
_G.binary = ""
local file = io.open(argument, "rb")
binary = file:read("a")
    if binary:match("[^10]") then
    else
        _G.hex_data = bin2hex(binary)
        io.open(argument, "w"):write(hex_data)
    end
file:close()

local dumped = ""
    local file = io.open(argument, "rb")
        for chunk in file:lines(16) do
            for hex in chunk:gmatch("%w%w") do
                dumped = dumped..hex2str(hex)
            end
        dumped = dumped.."\n"
        end
    assert(file:close())

print(dumped)
io.open(argument, "wb"):write(binary)
