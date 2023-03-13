return {
  'nvim-lua/plenary.nvim',
  {
    'elkowar/yuck.vim',
    ft = {
      "yuck"
    }
  },
  {
    'RRethy/vim-illuminate',
    event = "BufEnter"
  },
  {
    'williamboman/mason.nvim',
    config = true
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = true,
    event = 'BufReadPre'
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
    event = 'VeryLazy'
  },

  {
    'folke/which-key.nvim',
    config = true,
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
    event = 'BufEnter',
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
    config = { default = true },
    event = 'VeryLazy'
  },

  {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    config = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },

  {
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup({
        hide_cursor = false
      })
    end,
    event = 'VeryLazy'
  },

  {
    'lewis6991/gitsigns.nvim',
    config = true,
    event = 'BufReadPre'
  },

  {
    'danymat/neogen',
    event = 'BufEnter',
    config = function()
      require('neogen').setup({})
      require('util.map')({
        ['<Leader>gj'] = {
          action = function() require('neogen').generate({}) end,
          desc = 'Generate jsdoc comment'
        }
      })
    end
  },

  {
    'barrett-ruth/import-cost.nvim',
    build = 'sh install.sh yarn',
    config = true,
    ft = {
      'Javascript',
      'Javascriptreact',
      'Typescript',
      'Typescriptreact'
    }
  },

  {
    'glacambre/firenvim',
    build = function() vim.fn['firenvim#install'](0) end,
    config = function()
      vim.g.firenvim_config = {
        localSettings = {
          [".*"] = {
            cmdline = "neovim",
          }
        }
      }
    end
  }
}
