-- Options
--Key mapping
nnoremap('<Leader>lv',
  function()
    vim.cmd('e ' .. os.getenv('HOME') .. '/.config/nvim/ftplugin/rust.lua')
  end,
  'Open rust ftplugin'
)

-- rust-tools
nnoremap('<Leader>li',
  function()
    require('rust-tools.inlay_hints').toggle_inlay_hints()
  end,
  'Togger rust inlay hints'
)

nnoremap('<Leader>lc',
  function()
    require('rust-tools.open_cargo_toml').open_cargo_toml()
  end,
  'Open cargo toml'
)

nnoremap('<Leader>lh',
  function()
    require('rust-tools.hover_actions').hover_actions()
  end,
  'Hover action'
)
