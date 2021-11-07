local M = {}

R = function(module)
  package.loaded[module] = nil
  return require(module)
end

P = function(v)
  print(vim.inspect(v))
  return v
end

return M
