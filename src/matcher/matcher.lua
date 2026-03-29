Matcher = {}

function Matcher:fromFunction(matcherFunc)
    local matcher = { func=matcherFunc }
    setmetatable(matcher, self)
    self.__index = self
    return matcher
end