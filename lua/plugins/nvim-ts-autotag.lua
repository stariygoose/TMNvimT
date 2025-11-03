return {
	"windwp/nvim-ts-autotag",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- автозакрытие тегов
				enable_rename = true, -- синхронное переименование тегов
				enable_close_on_slash = true, -- автозакрытие при />
			},
		})
	end,
}
