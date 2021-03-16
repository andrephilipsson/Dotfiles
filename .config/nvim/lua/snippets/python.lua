local indent = require'snippets.utils'.match_indentation

local python = {}

python.bang = "#!/usr/local/bin python3"
python.enumerate = indent [[
for ${2:i}, ${3:v} in enumerate(${1:values}):
    $0
]]

return python
