#!/usr/bin/lua

-- reads from stdin a list of space or comma separated values and returns
-- alphanumeric text as string array filtering out all symbols and punctuations

local s = io.read('*a')
for str in string.gmatch(s, "[%w]+") do
     print('"'.. str .. '",')
end
