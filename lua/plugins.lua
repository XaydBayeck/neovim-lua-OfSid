local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- a start screen of vim or nvim
  use 'mhinz/vim-startify'
  -- TODO: replace to heirline
  -- animatial statusline
  use { 'windwp/windline.nvim' }
  -- use {
  --   'windwp/windline.nvim',
  --   config = function ()
  --     require("wlsample.airline_anim")
  --   end
  -- }
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- which-key
  use 'folke/which-key.nvim'
  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  -- lspconfig
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Language tools
  -- rust-tools
  use 'simrat39/rust-tools.nvim'
  use {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        require('crates').setup()
    end,
  }
  -- ron
  use 'ron-rs/ron.vim'
  -- clangd
  use {
    'p00f/clangd_extensions.nvim',
    config = function()
      require("clangd_extensions").setup()
    end
  }
  -- haskell-tool
  use {
    'MrcJkb/haskell-tools.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    -- tag = 'x.y.z' -- [^1]
  }

  -- nvim-cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  -- vsnip
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use "rafamadriz/friendly-snippets"
  use 'hrsh7th/cmp-vsnip'
  -- use 'nvim-autopairs'
  use "windwp/nvim-autopairs"
  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly',
    config = function()
      require("nvim-tree").setup()
    end
  }
  -- bufferline
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  -- surround
  use { "ur4ltz/surround.nvim" }
  -- use {
  --   "ur4ltz/surround.nvim",
  --   config = function()
  --     require("surround").setup { mappings_style = "surround" }
  --   end
  -- }
  -- Comment
  use { 'numToStr/Comment.nvim' }
  -- use {
  --   'numToStr/Comment.nvim',
  -- config = function()
  --   require("Comment").setup()
  -- end
  -- }
  -- nvim-coloizer
  use { 'norcalli/nvim-colorizer.lua' }
  -- use {
  --   'norcalli/nvim-colorizer.lua',
  --   function()
  --     require("colorizer").setup()
  --   end
  -- }
  -- gruvbox theme
  -- use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
  -- nord theme
  use 'shaunsingh/nord.nvim'

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
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }

  -- pretty folding
  use { 'anuvyklack/pretty-fold.nvim' }
  use { 'anuvyklack/fold-preview.nvim',
    requires = 'anuvyklack/keymap-amend.nvim',
    config = function()
      require('fold-preview').setup()
    end
  }

  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', cmd = 'MarkdownPreview'}
  -- TODO highlight
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- fish edit
  use 'dag/vim-fish'

  -- nix support
  use 'LnL7/vim-nix'

  -- julia support
  use 'JuliaEditorSupport/julia-vim'

  -- yuck eww config language support
  use 'elkowar/yuck.vim'

  -- idris2 support
  use { 'ShinKage/idris2-nvim', requires = { 'neovim/nvim-lspconfig', 'MunifTanjim/nui.nvim' } }

  -- nu shell lang support
  use { 'jose-elias-alvarez/null-ls.nvim', requires = { "nvim-lua/plenary.nvim" } }
  use {
    'LhKipp/nvim-nu',
    run = ':TSInstall nu',
    config = function()
      require('nu').setup {}
    end
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
