return {
	"Exafunction/windsurf.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,
			},
			workspace_root = {
				use_lsp = true,
			},
		})
	end,
}
