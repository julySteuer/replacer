require("src.util.util")
require("src.matcher.matchResult")

function TextMatcher(bundle)
    return CreateMatcher(
        function (string)
            if string:sub(1, #bundle.text) == bundle.text then
                return MatchResult:from(bundle, bundle.text)
            end
        end
)
end

function BalancedAround(bundle) -- beginning, ending, term, name 
    return CreateMatcher(
        function (string)
            local balance_count = 0
            local result = ""
            for i=1,#string do
                local char = string:sub(i, i)
                if balance_count == 0 and char == bundle.term then
                    break
                end
                if char == bundle.beginning then
                    balance_count = balance_count + 1
                end
                if char == bundle.ending then
                    balance_count = balance_count - 1
                end
                result = result..char
            end
            if balance_count ~= 0 then
                return nil
            end
            return MatchResult:from(bundle, result)
        end
    )
end

function Or(bundle) -- firstOp, secondOp
    return CreateMatcher(
        function (string)
            local firstMatch = bundle.firstOp:exec(string)
            if firstMatch ~= nil then
                return firstMatch
            end
            local secondMatch = bundle.secondOp:exec(string)
            if secondMatch ~= nil then
                return secondMatch
            end
            return nil
        end
    )
end

function Opt(bundle) -- op
    return CreateMatcher(
        function (string)
            local match = bundle.op:exec(string)
            if match == nil then
                return MatchResult:from({}, "")
            end
            return match
        end
    )
end