return require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"

    -- Telescope.nvim
    use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}
    }
    use "nvim-telescope/telescope-fzy-native.nvim"

    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      opt = true,
      ft = "markdown"
    }

    -- Git
    use "tpope/vim-fugitive"
    use "rhysd/git-messenger.vim"
    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"}
    }
    use "rhysd/committia.vim"

    use "joshdick/onedark.vim"
    use "wincent/base16-nvim"
    use "justinmk/vim-dirvish"
    use "kyazdani42/nvim-web-devicons"
    use "L3MON4D3/LuaSnip"
    use "tpope/vim-commentary"
    use "tpope/vim-eunuch"
    use "tpope/vim-repeat"
    use "tpope/vim-speeddating"
    use "tpope/vim-surround"
    use "wincent/corpus"
    use "wincent/loupe"
    use "wincent/pinnacle"
    use "lewis6991/impatient.nvim"

    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup()
      end
    }

    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup(nil, { css = true })
      end
    }

    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons"}
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use { "p00f/nvim-ts-rainbow", ft =  "clojure" }

    -- Lsp
    use "folke/lua-dev.nvim"
    use "glepnir/lspsaga.nvim"
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "f3fora/cmp-spell",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "kdheepak/cmp-latex-symbols",
        "saadparwaiz1/cmp_luasnip",
      }
    }
    use "mfussenegger/nvim-jdtls"
    use "neovim/nvim-lspconfig"
    use "scalameta/nvim-metals"

    -- Dap
    use "mfussenegger/nvim-dap"
  end
}
