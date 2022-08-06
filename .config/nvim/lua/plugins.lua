return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- UI
  use 'rebelot/kanagawa.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

  -- Langague specific plugins
  use 'neovim/nvim-lspconfig'
  -- nim
  use 'alaviss/nim.nvim'
  -- Arduino
  use 'stevearc/vim-arduino'
  -- pgsql
  use 'lifepillar/pgsql.vim'
  -- rust
  use 'simrat39/rust-tools.nvim'

  -- Code completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'

  -- Test
  use 'nvim-neotest/neotest'
  use 'rouge8/neotest-rust'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Utilities
  use 'tpope/vim-fugitive'
  use 'glepnir/dashboard-nvim'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'  }
  use { 'turbio/bracey.vim', run = 'npm install --prefix server' }
  use 'andweeb/presence.nvim'
  use 'unblevable/quick-scope'
  use 'kdheepak/lazygit.nvim'
  use 'Pocco81/TrueZen.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use { 'williamboman/mason.nvim' }
  use 'lewis6991/gitsigns.nvim'
  use 'b0o/mapx.nvim'
  use 'folke/which-key.nvim'
  use 'folke/trouble.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'onsails/lspkind.nvim'
  use 'echasnovski/mini.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
     run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'nvim-telescope/telescope-project.nvim' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'windwp/nvim-ts-autotag'

  -- Debug
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  -- Masochist
  use 'takac/vim-hardtime'

end)
