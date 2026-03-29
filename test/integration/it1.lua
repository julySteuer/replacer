require("src.prelude")

local text = TextMatcher { text="hello", name="hello_match" }
local text2 = TextMatcher { text="test", name="test_match" }

return {
    rules= {
        Replace(text, function (matches) return string.format("Hello %s", matches.hello_match) end),
        Replace(text2, function (matches) return string.format("Test test") end)
    }
}