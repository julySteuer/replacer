require("src.matcher.matcher")
require("src.matcher.matcherList")

function ConcatArray(arr1, arr2)
    local merged = {}
    for i=1, #arr1 do
        merged[i] = arr1[i]
    end
    for i=1, #arr2 do
        merged[i + #arr1] = arr2[i]
    end
    return merged
end

function DebugFields(table)
    if table == nil then
        print("Table is nil")
        return
    end
    for k, v in pairs(table) do
        print("key: ", k, ";value: ", v)
    end
end

function CreateMatcher(func) 
    local matcher = Matcher:fromFunction(func)
    return MatcherList:new(matcher)
end