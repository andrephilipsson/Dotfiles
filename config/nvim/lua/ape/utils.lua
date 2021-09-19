local M = {}

R = function(module)
  package.loaded[module] = nil
  return require(module)
end

P = function(v)
  print(vim.inspect(v))
  return v
end

M.feedkey = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

return M
