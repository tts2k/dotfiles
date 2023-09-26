vim.opt.number = true
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'
vim.opt.sw = 2
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.updatetime = 250
vim.opt.laststatus = 3
-- vim.opt.foldmethod = "expr"

vim.wo.wrap = false

-- Leader map
vim.g.mapleader = " "

--gui
if vim.g.neovide then
  vim.opt.guifont = { "JetBrains Mono", ":h11.5"}
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
