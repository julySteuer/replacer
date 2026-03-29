MatcherList = {}

function MatcherList:new(matcher)
    local matcher_list = { matcher }
    setmetatable(matcher_list, self)
    self.__index = self
    return matcher_list
end

function MatcherList.__add(first, second)
    local arr = ConcatArray(first, second)
    setmetatable(arr, MatcherList)
    return arr
end