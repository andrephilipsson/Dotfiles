local has_gitsigns, gitsigns = pcall(require, "gitsigns")

if not has_gitsigns then
    return
end

gitsigns.setup({})
