# Replacer
This tool is made to replace code in multiple files at once. 
It uses Rules that define matchers (which can also be context free) and a Replacer which defined with what the matches shall be replaced.

## Cli
```shell
lua ./src/main.lua <Exported Rules File> <Root Path of files that should be replaced> <File Matcher (glob like)>
```
## Matchers
Here is a list of currently supported Matchers.
Matcher can be put together with the + symbol
### TextMatcher
A basic text matcher without regex capability
```
text: The Text that shall be matched
name(optional): The name of the match group. if nil no matcher will be in the result
```
## BalanceAround
To match text that needs to have balanced parantheses for example foo.bar(...). A bit more powerful than standart regex
```
beginning: For which the inside counter should be incremented
end: For which char the inside counter should be decremented
term: For which char this matcher is finished iff the inside counter is 0
name(optional): The name of the match group. if nil no matcher will be in the result
```

## Example 
***Rules.lua***
```lua
require("src.prelude")

testMatcher = TextMatcher { text="test", name="test_match" }
testMatcher2 = textMatcher + TextMatcher { text="foo", name="foo_match" } -- This is also prossible

return {
    rules = {
        Replace(testMatcher, function (match) return "Test" end)
    }
}
```

Run this with 
```bash
lua ./src/main.lua Rules.lua . *.txt
```