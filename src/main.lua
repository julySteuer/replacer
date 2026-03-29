-- TextMatcher "asserThat(" + BalancedAround { beginning='(', end=')', name="first_arg", term=',' } + TextMatcher "," +  BalancedAround { beginning='(', end=')', name="second_arg", term=',' } + TextMatcher ")"
-- { name=match } + { name1=match1 } = { name=match, name1=match1 } 
require("src.executor")
require("src.util.util")
require("src.matcher.matchers")
require("src.replacer.replacer")
require("src.cli.runner")

--[[
local balancedAround = BalancedAround { beginning='(', ending=')', term=')', name="match" }
local merged = TextMatcher { text="assertThat(" } + balancedAround + TextMatcher { text=")" }
local executor = Executor:new(merged)
print(DebugFields(executor:execute("assertThat(hello())")))

local text = TextMatcher { text="hello", name="hello_match" }
local rules = Rules:new {
    Replace(text, function (matches) return string.format("Hello %s", matches.hello_match) end)
}

local out = rules:execute(arg[1])
print(out)
]]

RunCli(arg[1], arg[2], arg[3])


-- Get Path of the ruleset 
-- Get Returned Rules table  https://stackoverflow.com/questions/53991297/how-do-i-use-external-files-as-tables-in-lua
-- Execute 