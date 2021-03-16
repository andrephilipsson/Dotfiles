local indent = require'snippets.utils'.match_indentation

local markdown = {}

function make_table(csv)
  local str = "|"
  local headers_complete = false
  local headers = {}

  for cell in csv:gmatch('([^,]+)') do
    -- match and remove EOL char
    if cell:sub(-1) == '.' then
      cell = cell:sub(1, -2)
      headers_complete = true
    end

    -- capitalize each word
    cell = string.gsub(" "..cell, "%W%l", string.upper):sub(2)

    str = str .. string.format(" %s |", cell)
    headers[#headers+1] = cell:len()

    -- build the header separator
    if headers_complete then
      str = str .. '\n|'
      for i=1, #headers do
        str = str .. string.format(" %s |", string.rep('-', headers[i]))
      end
      str = str .. '\n|'
    end
  end
  return str
end

markdown.table = [[${1|make_table(S.v)}]]

markdown.h1 = [[# ]]
markdown.h2 = [[## ]]
markdown.h3 = [[### ]]
markdown.h4 = [[#### ]]
markdown.h5 = [[##### ]]
markdown.h6 = [[###### ]]

markdown.codeblock = [[
```$1
$0
```]]

return markdown
