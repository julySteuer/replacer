Matcher = {}

function Matcher:fromFunction(matcherFunc)
    local matcher = { func=matcherFunc }
    setmetatable(matcher, self)
    self.__index = self
    return matcher
end

function Matcher:exec(string)
    return self.func(string)
end