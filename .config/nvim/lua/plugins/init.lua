return {
  'nvim-lua/plenary.nvim',

  {
    'elkowar/yuck.vim',
    ft = { "yuck" }
  },

  {
    'RRethy/vim-illuminate',
    event = "BufEnter",
    keys = {
      { '[[', function() require("illuminate").goto_prev_reference() end, desc = "illuminate next" },
      { ']]', function() require("illuminate").goto_next_reference() end, desc = "illuminate next" }
    }
  },

  {
    'williamboman/mason.nvim',
    opts = {},
    cmd = "Mason"
  },

  {
    'norcalli/nvim-colorizer.lua',
    opts = {},
    event = 'BufReadPre'
  },

  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {},
  },

  {
    'nvim-tree/nvim-web-devicons',
    opts = { default = true },
    event = 'VeryLazy'
  },

  {
    'karb94/neoscroll.nvim',
    enabled = function() return vim.g.neovide == nil end,
    config = function()
      require('neoscroll').setup({
        hide_cursor = false
      })
    end,
    cond = function()
      return vim.g.neovide == nil
    end,
    event = 'VeryLazy'
  },

  {
    'danymat/neogen',
    event = 'BufEnter',
    opts = {},
    keys = {
      { '<Leader>gj', function() require('neogen').generate({}) end, desc = 'Generate jsdoc comment' }
    }
  },

  {
    'barrett-ruth/import-cost.nvim',
    build = 'sh install.sh yarn',
    opts = {},
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
    build = "deno task --quiet build:fast",
    opts = {
      app = "browser:"
    },
    cmd = "Peek",
    config = function(_, opts)
      require('peek').setup(opts)
      vim.api.nvim_create_user_command("PeekOpen", require('peek').open, {})
      vim.api.nvim_create_user_command("PeekOpen", require('peek').open, {})
    end
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
    event = { "BufReadPre" },
    opts = {
      line_num = {
        use_treesitter = true
      },
      blank = {
        enable = false
      }
    }
  },

  {
    "folke/neodev.nvim",
    opts = {}
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {},
    dependencies = {
      "folke/twilight.nvim"
    }
  },

  {
    '2kabhishek/nerdy.nvim',
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-telescope/telescope.nvim',
    },
    cmd = 'Nerdy',
  }
}
