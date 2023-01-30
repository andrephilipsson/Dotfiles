local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	-- Looks
	use("marko-cerovac/material.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip", tag = "v1.1.*" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" },
			{ "hrsh7th/cmp-emoji" },
			{ "hrsh7th/cmp-cmdline" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{
				"saadparwaiz1/cmp_luasnip",
				requires = { "L3MON4D3/LuaSnip", tag = "v1.1.*" },
			},
		},
	})
	use("github/copilot.vim")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
		},
	})
	use("folke/neodev.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- File navigation
	use({
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons",
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		cond = vim.fn.executable("make") == 1,
	})

	-- Utilities
	use({
		"numToStr/Comment.nvim",
		tag = "v0.7.*",
	})
	use({
		"kylechui/nvim-surround",
		tag = "v1.0.0",
	})
  use("tpope/vim-eunuch")
  use("wincent/loupe")

	if packer_bootstrap then
		require("packer").sync()
	end
end)

-- Automatically source and re-compile packer whenever this file is saved
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	group = packer_group,
	pattern = "plugins.lua",
})
