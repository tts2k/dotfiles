return function(tbl)
  for key, config in pairs(tbl) do
    local opts = vim.tbl_deep_extend("force", { desc = config.desc }, config.opts or {})
    vim.keymap.set(config.mode or 'n', key, config.action, opts)
  end
end
