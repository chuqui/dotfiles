#!/usr/bin/lua

-- reads from stdin a list of space or comma separated values and returns
-- text containing numbers as array filtering out all symbols and punctuations

local s = io.read('*a')
for str in string.gmatch(s, "[%d]+") do
     print(str .. ',')
end
