local vault_path = "~/.obsidian/Reading notes/"

local M = {
	"epwalsh/obsidian.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"toppair/peek.nvim",
	},
	opts = {
		dir = vault_path,
		completion = {
			nvim_cmp = true
		}
	}
}

return M
