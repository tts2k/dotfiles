return {
  'nvim-lua/plenary.nvim',
  'RRethy/vim-illuminate',
  {
    'williamboman/mason.nvim',
    config = true
  },

  {
    '~whynothugo/lsp_lines.nvim',
    url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = true
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = true
  },

  {
    'winwp/nvim-autopairs',
    config = true
  },

  {
    'folke/noice.nvim',
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          require('util.map')({
            ['<Leader><BS>'] = {
              action = function() require('notify').dissmiss() end,
              desc = 'Dismiss all notifications'
            }
          })
        end
      },
    },
    config = true
  },

  {
    'sitiom/nvim-numbertoggle',
    config = true
  },

  {
    'folke/which-key.nvim',
    config = true
  },

  {
    "SmiteshP/nvim-navic",
    config = function()
      vim.g.navic_silence = true
      require('nvim-navic').setup({ hightlight = true, depth_limit = 5 })
    end
  },

  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },

  {
    'b0o/mapx.nvim',
    config = { global = true, whichkey = true },
    dependencies = {
      'folke/which-key.nvim'
    }
  },

  {
    'nvim-tree/nvim-web-devicons',
    config = { default = true }
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },

  {
    'karb94/neoscroll.nvim',
    config = true
  },

  {
    'lewis6991/gitsigns.nvim',
    config = true
  },

  {
    'danymat/neogen',
    config = function()
      require('util.map')({
        ['<Leader>gj'] = {
          action = function() require('neogen').generate({}) end,
          desc = 'Generate jsdoc comment'
        }
      })
    end
  }
}
