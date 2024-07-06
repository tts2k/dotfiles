local M = {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  opts = {
    defaults = {
      layout_strategy = "vertical",
      color_devicons = true,
      path_display = { "truncate" },
      mappings = {
        n = {
          ["<C-d>"] = require("telescope.actions").delete_buffer,
        },
        i = {
          ["<C-h>"] = "which_key",
          ["<C-d>"] = require("telescope.actions").delete_buffer,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      file_browser = {
        hijack_netrw = true,
      },
      project = {
        base_dirs = {
          "~/projects/",
        },
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown(),
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "jvgrootveld/telescope-zoxide",
  },
}

local ui = require("util").ui

function M.config(_, opts)
  vim.api.nvim_create_user_command("TelescopeTabBuffers", function()
    local count = vim.v.count
    if vim.api.nvim_tabpage_is_valid(count) == false then
      return
    end

    local tab_cwd = vim.fn.getcwd(0, vim.v.count)
    ui.telescope.builtin("buffers", { sort_lastused = true, cwd = tab_cwd })
  end, { count = true })

  vim.api.nvim_create_user_command("TelescopeTabFiles", function()
    local count = vim.v.count
    if vim.api.nvim_tabpage_is_valid(count) == false then
      return
    end

    local tab_cwd = vim.fn.getcwd(0, vim.v.count)
    ui.telescope.builtin("fd", { sort_lastused = true, cwd = tab_cwd })
  end, { count = true })

  local telescope = require("telescope")
  telescope.setup(opts)
  telescope.load_extension("fzf")
  telescope.load_extension("ui-select")
  telescope.load_extension("file_browser")
  telescope.load_extension("zoxide")
end

-- Key mapping
M.keys = {
  {
    "<Leader>p",
    "<cmd>TelescopeTabFiles<cr>",
    desc = "Find files",
  },
  {
    "<Leader>:",
    function()
      ui.telescope.builtin("buffers", { sort_lastused = true })
    end,
    desc = "List buffers",
  },
  {
    "<Leader>;",
    "<cmd>TelescopeTabBuffers<cr>",
    desc = "List buffers",
  },
  {
    "<Leader>m",
    function()
      ui.telescope.builtin("marks")
    end,
    desc = "Show list of marks",
  },
  {
    "<Leader>/",
    function()
      ui.telescope.builtin("current_buffer_fuzzy_find")
    end,
    desc = "Current buffer fuzzy find",
  },
  {
    "<Leader>?",
    function()
      ui.telescope.builtin("live_grep")
    end,
    desc = "Current directory fuzzy find",
  },
  {
    "<Leader>v",
    function()
      ui.telescope.ext("file_browser", { path = "~/.config/nvim/lua" })
    end,
    "Open vim config directory",
  },
  {
    '<Leader>"',
    function()
      ui.telescope.builtin("registers")
    end,
    desc = "Fuzzy find register",
  },
  {
    "<Leader>.",
    function()
      ui.telescope.builtin("resume")
    end,
    desc = "Resume last search",
  },
  {
    "<Leader>>",
    function()
      ui.telescope.builtin("pickers")
    end,
    desc = "Search last pickers",
  },
  {
    "<Leader>v",
    function()
      ui.telescope.ext("file_browser", { path = "~/.config/nvim/lua" })
    end,
    desc = "Open vim config directory",
  },
  {
    "<Leader>cd",
    function()
      require("telescope").extensions.zoxide.list()
    end,
    desc = "Zoxide",
  },
}

return M
