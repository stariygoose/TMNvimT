return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	opts = {
		pickers = {
			colorscheme = {
				enable_preview = true,
				ignore_builtins = true, -- Ignore builtin themes (just doesn't appear)
			},
		},
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				prompt_prefix = "🔍 ",
				selection_caret = "➜ ",
			},
		})

		pcall(telescope.load_extension, "fzf")
	end,
}
