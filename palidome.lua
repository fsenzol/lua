local function isPalidome(str)
local str1 = str:gsub('[%p%s]','')
if string.reverse(str1) == str1 then
    return true
else return false
end
end

print(type(isPalidome('madam')))
io.write(type(tostring(isPalidome("madam"))))