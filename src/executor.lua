Executor = {}

function Executor:new(matchers)
    local new_executor = { matchers=matchers }
    setmetatable(new_executor, self)
    self.__index = self
    return new_executor
end

function Executor:execute(string)
    local current_string = string
    local matchers = self.matchers
    local matchResult = nil
    for i=1, #matchers do
        local matcher = matchers[i]
        local result = matcher.func(current_string)
        if result == nil then
            return nil
        end
        matchResult = result + matchResult
        current_string = current_string:sub(result.length + 1)
    end
    return matchResult
end