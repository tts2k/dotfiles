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
    config = true,
    cmd = "Mason"
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
        keys = {
          {
            '<Leader><BS>',
            function() require('notify').dismiss() end,
            desc = 'Dismiss all notifications'
          }
        }
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
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup({
        hide_cursor = false
      })
    end,
    event = 'VeryLazy'
  },

  {
    'danymat/neogen',
    event = 'BufEnter',
    config = true,
    keys = {
      {'<Leader>gj', function() require('neogen').generate({}) end, desc = 'Generate jsdoc comment' }
    }
  },

  {
    'barrett-ruth/import-cost.nvim',
    build = 'sh install.sh yarn',
    config = true,
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact'
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
  },

  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast"
  },

  {
    "JellyApple102/flote.nvim",
    opts = {},
    cmd = "Flote"
  },

  {
    "numToStr/Comment.nvim",
    opts = {},
    event = "BufEnter"
  },

  {
    "kylechui/nvim-surround",
    event = "BufEnter",
    opts = {}
  },

  {
    "wintermute-cell/gitignore.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" }
  },

  {
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {}
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    opts = {
      indent = {
        use_treesitter = true
      },
      line_num = {
        use_treesitter = true
      },
      blank = {
        enable = false
      }
    }
  },
}
