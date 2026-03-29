-- Replace(matchers, function(matchers) return f"${matchers.match}" end)
require("src.executor")
require("src.util.fileUtil")

function Replace(matchers, replacerFunc)
    local executor = Executor:new(matchers)
    return function (string)
        local results = executor:execute(string)
        if results == nil then
            return nil
        end
        return { length=results.length, replacement=replacerFunc(results) } -- replace from beginning to length with replacmenet 
    end
end

Rules = {}

function Rules:new(rules)
    setmetatable(rules, self)
    self.__index = self
    return rules
end

function Rules:execute(fileName)
    local fileContent = ReadFile(fileName)
    local currentString = fileContent
    local output = ""
    while #currentString > 0 do
        for _, rule in ipairs(self) do
            local result = rule(currentString)
            if result ~= nil then
                output = output..result.replacement
                currentString = currentString:sub(result.length + 1)
                -- one rule matched; abort scan
                break
            end
            output = output..currentString:sub(1, 1)
            currentString = currentString:sub(2)
        end
    end
    return output
end