return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- a start screen of vim or nvim
  use 'mhinz/vim-startify'
  -- animatial statusline
  use 'windwp/windline.nvim'
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- which-key
  use 'folke/which-key.nvim'
  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use {'nvim-telescope/telescope-ui-select.nvim' }
  -- lspconfig
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  -- rust-tools
  use 'simrat39/rust-tools.nvim'
  -- nvim-cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  -- vsnip
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"
  -- use 'nvim-autopairs'
  use "windwp/nvim-autopairs"
  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  -- bufferline
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  -- surround
  use {
    "ur4ltz/surround.nvim",
    config = function ()
      require"surround".setup {mappings_style = "surround"}
    end
  }
  -- Comment
  use 'numToStr/Comment.nvim'
  -- nvim-coloizer
  use 'norcalli/nvim-colorizer.lua'
  -- gruvbox theme
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

  -- lua edit
  use 'euclidianAce/BetterLua.vim'
  use 'tjdevries/manillua.nvim'

  -- easy motion
  use 'easymotion/vim-easymotion'

  -- highlight word under your cursor
  use 'RRethy/vim-illuminate'

  -- youdao dictionary
  use 'ianva/vim-youdao-translater'

  -- markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', cmd = 'MarkdownPreview'}

  -- fish edit
  use 'dag/vim-fish'

  -- nix support
  use 'LnL7/vim-nix'

  -- yuck eww config language support
  use 'elkowar/yuck.vim'
end)

