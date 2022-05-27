local ok, shade = pcall(require, "shade")
if not ok then
  return
end

shade.setup({
  overlay_opacity = 50,
})
