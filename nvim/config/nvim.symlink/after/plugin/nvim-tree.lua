local has_tree, tree = pcall(require, "nvim-tree")

if not has_tree then
	return
end

tree.setup({
	sort_by = "case_sensitive",
	select_prompts = false,
	filters = {
		dotfiles = true,
	},
})

vim.keymap.set("n", "<leader>-", vim.cmd.NvimTreeToggle, { noremap = true, silent = true })
