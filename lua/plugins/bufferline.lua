return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- Optional: для git статуса
		"nvim-tree/nvim-web-devicons", -- Optional: для иконок
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		-- Основные настройки
		animation = true,
		auto_hide = false,
		tabpages = true,
		clickable = true,

		-- Номера буферов (как твой ordinal)
		icons = {
			buffer_index = true, -- Показывать номера
			buffer_number = false,
			button = "",
			filetype = {
				enabled = true, -- Отключаем иконки файлов (как у тебя color_icons = false)
			},
			separator = { left = "▎", right = "" },
			modified = { button = "●" },
			pinned = { button = "", filename = true },
			preset = "default",

			-- Диагностика (как у тебя diagnostics = "nvim_lsp")
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
				[vim.diagnostic.severity.WARN] = { enabled = true, icon = "" },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = false },
			},

			gitsigns = {
				added = { enabled = false },
				changed = { enabled = false },
				deleted = { enabled = false },
			},
		},

		-- Максимальная длина имени буфера
		maximum_padding = 1,
		minimum_padding = 1,
		maximum_length = 30,

		-- Сортировка
		sidebar_filetypes = {
			NvimTree = true,
		},
	},
}
