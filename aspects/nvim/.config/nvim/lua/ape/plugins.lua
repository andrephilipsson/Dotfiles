return require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"

    -- speed up startup
    use "lewis6991/impatient.nvim"

    -- notetaking / markdown
    use "wincent/corpus"
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      opt = true,
      ft = "markdown"
    }

    -- git
    use "tpope/vim-fugitive"
    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"}
    }

    -- Telescope.nvim
    use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"}
    }
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "nvim-telescope/telescope-ui-select.nvim"

    -- filesystem navigation
    use "justinmk/vim-dirvish"

    -- completion
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
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup()
      end
    }

    -- snippets
    use "L3MON4D3/LuaSnip"

    -- colors
    use "wincent/base16-nvim"
    use "wincent/pinnacle"
    use "kyazdani42/nvim-web-devicons"

    use "delphinus/vim-firestore"

    -- general utils
    use "tpope/vim-eunuch"
    use "tpope/vim-repeat"
    use "tpope/vim-commentary"
    use "tpope/vim-speeddating"
    use "tpope/vim-surround"
    use "wincent/loupe"


    -- LSP
    use "folke/lua-dev.nvim"
    use "neovim/nvim-lspconfig"
    use "onsails/lspkind-nvim"
    use "kosayoda/nvim-lightbulb"
    use "mfussenegger/nvim-jdtls"
    use {
      "scalameta/nvim-metals",
      requires = {"nvim-lua/plenary.nvim"}
    }

    -- dap
    use "mfussenegger/nvim-dap"

    -- treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "nvim-treesitter/nvim-treesitter-textobjects"

    -- things that might be a part of nvim at some point
    use "tjdevries/astronauta.nvim"
  end
}
