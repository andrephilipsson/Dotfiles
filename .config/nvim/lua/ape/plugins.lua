return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    -- Telescope.nvim
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install'
    }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'rhysd/git-messenger.vim'
    use {
      'lewis6991/gitsigns.nvim',
      requires = {'nvim-lua/plenary.nvim'}
    }

    use 'chriskempson/base16-vim'
    use 'junegunn/vim-easy-align'
    use 'justinmk/vim-dirvish'
    use 'kyazdani42/nvim-web-devicons'
    use 'norcalli/nvim-colorizer.lua'
    use 'norcalli/snippets.nvim'
    use 'tomtom/tcomment_vim'
    use 'tpope/vim-repeat'
    use 'tpope/vim-speeddating'
    use 'tpope/vim-surround'
    use 'wincent/corpus'
    use 'wincent/loupe'
    use 'wincent/pinnacle'
    use 'windwp/nvim-autopairs'

    -- Lsp
    use 'glepnir/lspsaga.nvim'  -- only used for fancy rename popup
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'scalameta/nvim-metals'

    -- This will most likely be available in neovim 0.5 release
    use 'tjdevries/astronauta.nvim'

    -- TODO: Look into setting up these
    -- use 'mfussenegger/nvim-dap'
    -- use 'theHamsta/nvim-dap-virtual-text'
  end
}
