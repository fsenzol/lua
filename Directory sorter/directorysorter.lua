-- A programm to sort a directory, with folder names being file's extension
-- This program is for posix(linux) systems only
-- 

local directory = arg[1] or io.popen("pwd"):read("a")
    directory = directory:gsub("\n", "")
io.input(directory)
local temp = io.popen("ls"):read("a")
local temp1 = io.open("temp", "w"):write(temp)
local file = io.popen("ls", "r")
    local extensions = {}
    local file_ext = {}
        for line in file:lines() do                       -- Gets all file's extension in the directory kinda useless tho! :(
            for content in line:gmatch(".*%.(%w+)") do
                file_ext[#file_ext + 1] = content
            end
        end
        for index, ext in pairs(file_ext) do            -- It gets a unique extension, thats no duplicate
            for i = 1, #extensions do
                if extensions[i] == ext then
                    extensions[i] = nil
                end
            end
            extensions[#extensions+1] = ext
        end
        for index, folder in pairs(extensions) do
            os.execute(string.format("mkdir %s", folder))
                for line in io.lines("temp") do
                    if line:match("."..folder) then
                        os.execute(string.format("mv %s %s", line, folder))
                        print("Organising your directory, please wait...")
                    end
                end
        end
os.remove("temp")
os.execute("clear")
print("Done, your directory has been organised!")