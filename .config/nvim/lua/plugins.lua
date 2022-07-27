return require('packer').startup(function(use)

  -- UI
  use 'rebelot/kanagawa.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-lualine/lualine.nvim'

  -- Langague support
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  -- nim
  use 'alaviss/nim.nvim'
  -- Arduino
  use 'stevearc/vim-arduino'
  -- pgsql
  use 'lifepillar/pgsql.vim'

  -- Code completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Utilities
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'glepnir/dashboard-nvim'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'  }
  use { 'turbio/bracey.vim', run = 'npm install --prefix server' }
  use 'andweeb/presence.nvim'
  use 'unblevable/quick-scope'
  use 'kdheepak/lazygit.nvim'
  use 'Pocco81/TrueZen.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons'
  use { 'williamboman/mason.nvim' }
  use 'lewis6991/gitsigns.nvim'
  use 'b0o/mapx.nvim'
  use 'folke/which-key.nvim'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
     run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'nvim-telescope/telescope-project.nvim' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'windwp/nvim-ts-autotag'

  -- Debug
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  -- Masochist
  use 'takac/vim-hardtime'

end)
