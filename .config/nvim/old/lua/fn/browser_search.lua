local link = "https://github.com/thekbbohara"

if string.find(link, "//") then
	link = link:match("//(.+)") -- Extract part after '//' using pattern matching
	if string.find(link, "/") then
		link = link:match("([^/]+)") -- Extract part before the first '/'
	end
end
print(link)
