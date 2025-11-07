return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		hijack_cursor = true,
		update_focused_file = { enable = true },
		-- Diagnostics
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = true,
			debounce_delay = 50,
			severity = {
				min = vim.diagnostic.severity.WARN,
				max = vim.diagnostic.severity.ERROR,
			},
		},

		-- Git интеграция
		git = {
			enable = true,
			ignore = false,
		},

		-- Renderer настройки
		renderer = {
			highlight_git = true,
			highlight_opened_files = "name",
			highlight_diagnostics = "name",

			icons = {
				diagnostics_placement = "after",
				git_placement = "after",
				show = {
					git = true,
					diagnostics = true,
				},
				glyphs = {
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "C",
						renamed = "R",
						untracked = "U",
						deleted = "D",
						ignored = "◌",
					},
				},
			},

			indent_markers = {
				enable = true,
			},
		},

		-- Modified файлы
		modified = {
			enable = true,
		},

		-- Кастомные кейбинды
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			-- Используем дефолтные кейбинды
			api.config.mappings.default_on_attach(bufnr)

			-- Добавляем кастомный для 'l'
			vim.keymap.set("n", "l", api.node.open.edit, {
				buffer = bufnr,
				noremap = true,
				silent = true,
				desc = "Open file",
			})
		end,
	},
}
