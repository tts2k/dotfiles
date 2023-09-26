local M = {
  "luukvbaal/statuscol.nvim",
}

function M.config()
  local builtin = require("statuscol.builtin")
  require("statuscol").setup({
    setopt = true,
    relculright = true,
    ft_ignore = { "neo-tree" },
    segments = {
      { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
      {
        sign = { name = { "GitSigns", "Diagnostic" }, maxwidth = 1 },
        click = "v:lua.ScSa"
      },
      { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    },
  })
end

return M
