

local function hex2str(hex)
    hex = tostring(hex)
    local result = ""
        for str in hex:gmatch("%x%x") do
            result = result..(string.char(string.format("%d", tonumber(str, 16))))
        end
    return result
end