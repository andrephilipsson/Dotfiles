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

    use "joshdick/onedark.vim"
    use "justinmk/vim-dirvish"
    use "kyazdani42/nvim-web-devicons"
    use "norcalli/snippets.nvim"
    use "tpope/vim-commentary"
    use "tpope/vim-eunuch"
    use "tpope/vim-repeat"
    use "tpope/vim-speeddating"
    use "tpope/vim-surround"
    use "wincent/corpus"
    use "wincent/loupe"
    use "wincent/pinnacle"
    use "tjdevries/astronauta.nvim"

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
    use "glepnir/lspsaga.nvim"
    use "neovim/nvim-lspconfig"
    use "scalameta/nvim-metals"
    use "hrsh7th/nvim-compe"

    -- Dap
    use "mfussenegger/nvim-dap"
  end
}
