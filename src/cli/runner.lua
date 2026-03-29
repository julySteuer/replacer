require("src.util.fileUtil")
require("src.replacer.replacer")

function RunCli(scriptPath, basePath, filePattern)
    local files = GetFiles(basePath, filePattern)
    print("Files found "..#files)

    print("Loading from script file "..scriptPath)
    local scriptFile = require(scriptPath)
    print("Script File loaded")
    local rules = scriptFile.rules
    for _, file in ipairs(files) do
        print("Working on "..file)
       local newContent = Rules:new(rules):execute(file)
       ReplaceFileContent(file, newContent)
    end
end