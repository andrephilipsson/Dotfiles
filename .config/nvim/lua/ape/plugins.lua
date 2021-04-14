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
      ft = "markdown"
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use { "p00f/nvim-ts-rainbow", ft =  "clojure" }

    -- Git
    use "tpope/vim-fugitive"
    use "rhysd/git-messenger.vim"
    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"}
    }

    use "chriskempson/base16-vim"
    use "junegunn/vim-easy-align"
    use "justinmk/vim-dirvish"
    use "kyazdani42/nvim-web-devicons"
    use "norcalli/snippets.nvim"
    use "tpope/vim-commentary"
    use "tpope/vim-repeat"
    use "tpope/vim-speeddating"
    use "tpope/vim-surround"
    use "wincent/corpus"
    use "wincent/loupe"
    use "wincent/pinnacle"

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

    -- Got to stop that jjjjjjj-ing and kkkkkkkk-ing
    use "takac/vim-hardtime"

    -- Lsp
    use "glepnir/lspsaga.nvim"
    use "neovim/nvim-lspconfig"
    use "nvim-lua/completion-nvim"
    use "scalameta/nvim-metals"

    -- This will most likely be available in neovim 0.5 release
    use "tjdevries/astronauta.nvim"

    -- TODO: Look into setting up these
    -- use 'mfussenegger/nvim-dap'
    -- use 'theHamsta/nvim-dap-virtual-text'
  end
}
