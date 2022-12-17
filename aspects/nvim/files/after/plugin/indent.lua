local has_indent, indent = pcall(require, "indent_blankline")

if not has_indent then
	return
end

indent.setup({
	use_treesitter = false,
	filetype_exclude = { "help", "packer", "checkhealth", "lspinfo" },
})
