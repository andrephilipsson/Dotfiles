local has_lightbulb, lightbulb = pcall(require, "nvim-lightbulb")
if not has_lightbulb then
  return
end

lightbulb.setup({
  sign = {
    enabled = true,
    priority = 10,
    text = "💡",
  },
  autocmd = {
    enabled = true,
  },
})
