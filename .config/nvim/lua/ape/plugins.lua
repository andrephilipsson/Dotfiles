return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    use {
      'wincent/command-t',
      run = 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    }

    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install'
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    use 'chriskempson/base16-vim'
    use 'junegunn/vim-easy-align'
    use 'justinmk/vim-dirvish'
    use 'norcalli/nvim-colorizer.lua'
    use 'norcalli/snippets.nvim'
    use 'rhysd/git-messenger.vim'
    use 'tomtom/tcomment_vim'
    use 'tpope/vim-fugitive'
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

    -- This will most likely be available 0.5 release
    use 'tjdevries/astronauta.nvim'

    -- TODO: Look into setting up these
    -- use 'mfussenegger/nvim-dap'
    -- use 'theHamsta/nvim-dap-virtual-text'
  end
}
