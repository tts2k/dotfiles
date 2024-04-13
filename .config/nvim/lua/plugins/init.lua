return {
  "nvim-lua/plenary.nvim",

  {
    "elkowar/yuck.vim",
    ft = { "yuck" },
  },

  {
    "RRethy/vim-illuminate",
    event = "BufEnter",
  },

  {
    "williamboman/mason.nvim",
    opts = {},
    cmd = "Mason",
  },

  {
    "norcalli/nvim-colorizer.lua",
    opts = {},
    event = "BufReadPre",
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = { default = true },
    event = "VeryLazy",
  },

  {
    "karb94/neoscroll.nvim",
    enabled = function()
      return vim.g.neovide == nil
    end,
    config = function()
      require("neoscroll").setup({
        hide_cursor = false,
      })
    end,
    cond = function()
      return vim.g.neovide == nil
    end,
    event = "VeryLazy",
  },

  {
    "danymat/neogen",
    event = "BufEnter",
    opts = {},
    keys = {
      {
        "<Leader>gj",
        function()
          require("neogen").generate({ snippet_engine = "luasnip" })
        end,
        desc = "Generate docs comment",
      },
    },
  },

  {
    "glacambre/firenvim",
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    config = function()
      vim.g.firenvim_config = {
        localSettings = {
          [".*"] = {
            cmdline = "neovim",
          },
        },
      }
    end,
  },

  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    opts = {
      app = "browser",
    },
    cmd = "Peek",
    config = function(_, opts)
      require("peek").setup(opts)
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    end,
  },

  {
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
  },

  {
    "tts2k/hlchunk.nvim",
    branch = "exclude-ft",
    event = { "BufReadPre" },
    opts = {
      line_num = {
        use_treesitter = true,
      },
      blank = {
        enable = false,
      },
    },
  },

  {
    "folke/neodev.nvim",
    opts = {},
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {},
    dependencies = {
      "folke/twilight.nvim",
    },
  },

  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },

  {
    "simeji/winresizer",
    event = "UIEnter",
    keys = {
      { "<C-s>", "<cmd>WinResizerStartMove<CR>", desc = "Start resizing win" },
    },
  },

  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },

  {
    "stevearc/aerial.nvim",
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "{", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    },
    keys = {
      { "<Leader>a", "<cmd>AerialToggle!<CR>" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "j-hui/fidget.nvim",
    event = "UIEnter",
    opts = {},
  },
}
