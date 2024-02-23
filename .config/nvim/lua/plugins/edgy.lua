local M = {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    wo = {
      winhighlight = "",
    },
    animate = {
      -- Enable only when not running in neovide
      enabled = vim.g.neovide == nil
    },
    bottom = {
      {
        ft = "toggleterm",
        size = { height = 0.4 },
        -- exclude floating windows
        filter = function(_, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      "Trouble",
      { ft = "qf",            title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      { ft = "qf",            title = "QuickFix" },
      { ft = "spectre_panel", size = { height = 0.4 } },
    },
    left = {
      {
        ft = "neo-tree",
        title = "Neo-Tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { width = 40 }
      },
      {
        ft = "neo-tree",
        title = "Neo-Tree Git status",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "git_status"
        end,
        size = { width = 40 }
      },
    }
  }
}

return M
