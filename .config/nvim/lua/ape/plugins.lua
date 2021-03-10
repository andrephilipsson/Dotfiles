return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    use {
      'wincent/command-t',
      run = 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    }

    use 'nvim-lua/completion-nvim'
    use 'wincent/corpus'
    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install'
    }
    use {'neovim/nvim-lspconfig'}

    use 'scalameta/nvim-metals'

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    use 'chriskempson/base16-vim'
    use 'wincent/loupe'
    use 'wincent/pinnacle'
    use 'tomtom/tcomment_vim'
    use 'justinmk/vim-dirvish'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-speeddating'
    use 'tpope/vim-surround'
    use 'windwp/nvim-autopairs'
    use 'norcalli/nvim-colorizer.lua'
    use 'junegunn/vim-easy-align'
    use 'tjdevries/astronauta.nvim'
    use 'SirVer/ultisnips'
  end
}
