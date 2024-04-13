local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  opts = {
    open_mapping = [[<c-\>]],
    shade_terminals = false,
  },
}

local create_cmd_terminal = function(cmd, opts)
  local Terminal = require("toggleterm.terminal").Terminal
  local term_opts = {
    cmd = cmd,
    dir = "git_dir",
    hidden = true,
    direction = "float",
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<c-t>", "<cmd>close<CR>", {
        silent = false,
        noremap = true,
      })
    end,
  }

  term_opts = vim.tbl_deep_extend("keep", term_opts, opts or {})

  return Terminal:new(term_opts)
end

M.config = function(_, opts)
  require("toggleterm").setup(opts)

  local lazygit = create_cmd_terminal("lazygit")
  local lazydocker = create_cmd_terminal("lazydocker")
  local btop = create_cmd_terminal("btop")
  local ranger = create_cmd_terminal("ranger")

  vim.api.nvim_create_user_command("Lg", function()
    lazygit:toggle()
  end, { nargs = "?" })
  vim.api.nvim_create_user_command("Ld", function()
    lazydocker:toggle()
  end, { nargs = "?" })
  vim.api.nvim_create_user_command("Bt", function()
    btop:toggle()
  end, { nargs = "?" })
  vim.api.nvim_create_user_command("Rg", function()
    ranger:toggle()
  end, { nargs = "?" })
end

M.keys = {
  { "<C-w>", "<C-\\><C-n><C-w>", mode = "t" },
  { "<C-n>", "<C-\\><C-n>", mode = "t" },
}
return M
