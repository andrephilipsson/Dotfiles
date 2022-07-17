return require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")

    -- Speed up startup
    use("lewis6991/impatient.nvim")

    -- Notetaking / Markdown
    use("wincent/corpus")
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      opt = true,
      ft = "markdown",
    })

    -- General utils
    use("tpope/vim-eunuch")
    use("tpope/vim-repeat")
    use("tpope/vim-speeddating")
    use("tpope/vim-surround")
    use("wincent/loupe")
    use("wincent/replay")
    use("numToStr/Comment.nvim")
    use("windwp/nvim-autopairs")
    use("justinmk/vim-dirvish")

    -- Git
    use("tpope/vim-fugitive")
    use("tpope/vim-rhubarb")
    use("lewis6991/gitsigns.nvim")

    -- Looks
    use("sunjon/Shade.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("marko-cerovac/material.nvim")
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("windwp/nvim-ts-autotag")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    use("nvim-telescope/telescope-fzy-native.nvim")

    -- Completion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-emoji")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp")
    use("f3fora/cmp-spell")
    use("saadparwaiz1/cmp_luasnip")

    use("L3MON4D3/LuaSnip")

    use("github/copilot.vim")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("folke/lua-dev.nvim")
    use("kosayoda/nvim-lightbulb")
    use({
      "scalameta/nvim-metals",
      requires = { "nvim-lua/plenary.nvim" },
    })
    use("mfussenegger/nvim-jdtls")

    use({
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
    })
  end,
})
