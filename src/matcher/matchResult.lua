MatchResult = {}

function MatchResult:from(bundle, match)
    local new_match = { length=#match }
    setmetatable(new_match, self)
    self.__index = self
    if bundle.name ~= nil then
        new_match[bundle.name] = match
    end
    return new_match
end

function MatchResult.__add(first, second)
    if first == nil then
        return second
    end
    if second == nil then
        return first
    end
    local result = {}
    for k, v in pairs(first) do
        result[k] = v
    end
    for k, v in pairs(second) do
        result[k] = v
    end
    result.length = first.length + second.length
    return result
end