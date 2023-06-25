-- A programm to sort a directory, with folder names being file's extension
-- This program is for posix(linux) systems only
-- print(arguments)

local directory = arg[1] or io.popen("pwd"):read("a")
directory = directory:gsub("\n", "")
local dir = "'"..directory.."'"
local temp = io.popen(string.format("ls %s", dir)):read("a")
local temp1 = io.open("temp", "w"):write(temp)
local file = io.popen(string.format("ls %s", "'"..directory.."'"), "r")
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
            local exte = folder
            folder = directory..'/'..folder
            print("folder:",folder)      
            os.execute(string.format("mkdir %s", "'"..folder.."'"))
                for line in io.lines("temp") do
                    line = directory.."/"..line
                    line = line:gsub("\n", "")
                    line = "'"..line.."'"
                    print("line:", line)
                        if line:match("%."..exte) then
                            print(exte)         
                            local error = io.popen(string.format("mv %s %s", line, "'"..folder.."'")):read("a")
                            print(error)
                            print("Organising your directory, please wait...")
                            print("line, folder:", line, folder)
                        end
                end
        end
os.remove("temp")
-- os.execute("clear")
print("Done, your directory has been organised!")