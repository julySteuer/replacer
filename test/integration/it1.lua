require("src.prelude")

local foo = TextMatcher { text="foo", name="foo_match" }
local bar = TextMatcher { text="bar", name="bar_match" }
local foobar = foo + bar
local orTest = Or { firstOp=foo, secondOp=bar }
local optTest = foo + Opt { op=bar } + foo -- "barfoofoo" -> Test test "barfoo" -> Test test

return {
    rules= {
        Replace(optTest, function (matches)
             return string.format("Test test")
             end)
    }
}