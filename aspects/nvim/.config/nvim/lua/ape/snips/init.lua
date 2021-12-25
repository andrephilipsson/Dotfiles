local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node

local splitCommentstring = function ()
  local comment = string.gsub(vim.opt.commentstring:get(), "%s+", "")
  local start, ends = string.find(comment, "%s", 1, true)
  return string.sub(comment, 1, start - 1), string.sub(comment, ends + 1, #comment)
end

local addWhiteSpace = function(str)
  if #str == 0 then
    return str
  else
    return " " .. str
  end
end

ls.snippets = {
 all = {
    s(
      { trig = "date", dscr="Today's Date" },
      f(function() return os.date("%Y-%m-%d") end, {})
    ),
    s("todo",
      {
        f(function()
          local str, _ = splitCommentstring()
            return str .. " TODO: "
        end, {}),
        i(1),
        f(function()
          local _, str = splitCommentstring()
          return addWhiteSpace(str)
        end, {}),
        i(0)
      }
    ),
    s("fixme",
      {
        f(function()
          local str, _ = splitCommentstring()
            return str .. " FIXME: "
        end, {}),
        i(1),
        f(function()
          local _, str = splitCommentstring()
          return addWhiteSpace(str)
        end, {}),
        i(0)
      }
    )
  }
}
