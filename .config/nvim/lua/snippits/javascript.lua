--[[                                  ____
           /\ \                     /\  _`\           __
           \ \ \      __  __     __ \ \,\L\_\    ___ /\_\  _____
            \ \ \  __/\ \/\ \  /'__`\\/_\__ \  /' _ `\/\ \/\ '__`\
             \ \ \L\ \ \ \_\ \/\ \L\.\_/\ \L\ \/\ \/\ \ \ \ \ \L\ \
              \ \____/\ \____/\ \__/.\_\ `\____\ \_\ \_\ \_\ \ ,__/
               \/___/  \/___/  \/__/\/_/\/_____/\/_/\/_/\/_/\ \ \/
                                                             \ \_\
                                                              \/_/
]]

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local parse = require("luasnip.util.parser").parse_snippet

return {
	ls.add_snippets("javascript", {
		-- console .log
		s("log", {
			t('console.log("'),
			i(1, "msg"),
			t('");'),
		}),
		-- ternary operator snippet
		parse("ternary", "${1:if}?${2:then}:${3:else}"),
		-- function
		parse({ trig = "fn" }, "function ${1:fn} (${2:params}){\n ${0:command}\n}"),
		-- arrow function
		parse("afn", "const ${1:afn} = (${2:e}) => {\n ${0:return}\n}"),
		-- class
		parse("class", "class ${1:Class}{\n  constructor(${2:x}){\n    this.${3:x}\n  }\n}"),
	}),
}
