function GetFiles(rootDir, fileMatcher)
    local files = {}
    for file in io.popen(string.format("find %s -name %s", rootDir, fileMatcher)):lines() do
        table.insert(files, file)
    end
    return files
end

function ReplaceFileContent(path, content)
    local file = assert(io.open(path, "w"))
    file:write(content)
end

function ReadFile(fileName)
    local file = io.open(fileName, "r")
    if file == nil then
        error("File could not be opened", 1)
    end
    local content = file:read("*all")
    file:close()
    return content
end