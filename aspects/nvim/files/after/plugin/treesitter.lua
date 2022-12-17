local has_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")

if not has_treesitter then
	return
end

treesitter.setup({
	ensure_installed = "all",
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		--[[ disable = function(lang, buf)
        local max_filesize = 100 * 1024
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end, --]]
	},
	indent = true,
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
	callback = function()
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	end,
})
