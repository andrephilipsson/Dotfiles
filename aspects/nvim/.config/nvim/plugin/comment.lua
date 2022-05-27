local ok, comment = pcall(require, "Comment")
if not ok then
  return
end

comment.setup({
  mappings = {
    extra = true,
  },

  pre_hook = function(ctx)
    local U = require("Comment.utils")

    local ok, ts_commentstring_utils = pcall(require, "ts_context_commentstring.utils")
    if not ok then
      return
    end

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = ts_commentstring_utils.get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = ts_commentstring_utils.get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring({
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    })
  end,
})
