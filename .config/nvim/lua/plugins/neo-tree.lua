local M = {
  'nvim-neo-tree/neo-tree.nvim',
  branch = "v3.x",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim'
  },
  keys = {
    { "<Leader>n", "<cmd>Neotree<CR>" }
  },
  opts = {
    source_selector = {
      winbar = true,
      content_layout = "center",
      sources = {
        { source = "filesystem",  display_name = "  File" },
        { source = "git_status",  display_name = "  Git" },
        { source = "diagnostic", display_name = "  Diagnostics" },
      }
    },
    window = {
      width = 40,
      mappings = {
        ["<space>"] = false,
        ["b["] = "prev_source",
        ["b]"] = "next_source",
      }
    },
    close_if_lasst_window = true,
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
    },
    event_handlers = {
      event = "neo_tree_buffer_enter",
      handler = function(_) vim.opt_local.signcolumn = "auto" end
    }
  }
}

return M
