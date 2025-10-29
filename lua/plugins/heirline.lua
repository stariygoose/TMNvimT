return {
  "rebelot/heirline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")

    -- Цвета из tmnt темы
    local colors = {
      bg = "#212121",
      bg_alt = "#1a1a1a",
      bg_highlight = "#252525",
      fg = "#e0e0e0",
      fg_alt = "#808080",
      black = "#000000",
      white = "#ffffff",

      -- Цвета черепашек
      leo_blue = "#5B9BD5",        -- Leonardo: Leader
      raph_red = "#dc143c",        -- Raphael: Errors/Action
      donnie_purple = "#9370db",   -- Donatello: Strings/Creative
      mikey_orange = "#ff8c00",    -- Michelangelo: Warnings/Tech

      turtle_green = "#4a9b4a",    -- Успех/Git
      ooze_green = "#7fff00",      -- Радиоактивный акцент

      concrete = "#6a6a6a",
      sewer_gray = "#404040",
    }

    -- Подключаем цвета к heirline
    require("heirline").load_colors(colors)

    -- ============================================================================
    -- КОМПОНЕНТЫ
    -- ============================================================================

    -- Режим VIM (Leonardo - лидер)
    local ViMode = {
      init = function(self)
        self.mode = vim.fn.mode(1)
      end,
      static = {
        mode_names = {
          n = "NORMAL",
          no = "O-PENDING",
          nov = "O-PENDING",
          noV = "O-PENDING",
          ["no\22"] = "O-PENDING",
          niI = "NORMAL",
          niR = "NORMAL",
          niV = "NORMAL",
          nt = "NORMAL",
          v = "VISUAL",
          vs = "VISUAL",
          V = "V-LINE",
          Vs = "V-LINE",
          ["\22"] = "V-BLOCK",
          ["\22s"] = "V-BLOCK",
          s = "SELECT",
          S = "S-LINE",
          ["\19"] = "S-BLOCK",
          i = "INSERT",
          ic = "INSERT",
          ix = "INSERT",
          R = "REPLACE",
          Rc = "REPLACE",
          Rx = "REPLACE",
          Rv = "V-REPLACE",
          Rvc = "V-REPLACE",
          Rvx = "V-REPLACE",
          c = "COMMAND",
          cv = "EX",
          r = "...",
          rm = "MORE",
          ["r?"] = "CONFIRM",
          ["!"] = "SHELL",
          t = "TERMINAL",
        },
        mode_colors = {
          n = "leo_blue",
          i = "turtle_green",
          v = "donnie_purple",
          V = "donnie_purple",
          ["\22"] = "donnie_purple",
          c = "mikey_orange",
          s = "donnie_purple",
          S = "donnie_purple",
          ["\19"] = "donnie_purple",
          R = "raph_red",
          r = "raph_red",
          ["!"] = "raph_red",
          t = "turtle_green",
        },
      },
      provider = function(self)
        return " %2(" .. self.mode_names[self.mode] .. "%) "
      end,
      hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = "black", bg = self.mode_colors[mode] or "leo_blue", bold = true }
      end,
      update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
          vim.cmd("redrawstatus")
        end),
      },
    }

    -- Git Branch (Turtle Green)
    local Git = {
      condition = conditions.is_git_repo,

      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
      end,

      -- Branch name
      {
        provider = function(self)
          return "  " .. self.status_dict.head .. " "
        end,
        hl = { fg = "turtle_green", bold = true },
      },

      -- Добавленные строки
      {
        condition = function(self)
          return self.status_dict.added and self.status_dict.added > 0
        end,
        provider = function(self)
          return "+" .. self.status_dict.added .. " "
        end,
        hl = { fg = "turtle_green" },
      },

      -- Измененные строки
      {
        condition = function(self)
          return self.status_dict.changed and self.status_dict.changed > 0
        end,
        provider = function(self)
          return "~" .. self.status_dict.changed .. " "
        end,
        hl = { fg = "mikey_orange" },
      },

      -- Удаленные строки
      {
        condition = function(self)
          return self.status_dict.removed and self.status_dict.removed > 0
        end,
        provider = function(self)
          return "-" .. self.status_dict.removed .. " "
        end,
        hl = { fg = "raph_red" },
      },
    }

    -- Диагностика LSP (Ошибки, предупреждения)
    local Diagnostics = {
      condition = conditions.has_diagnostics,

      static = {
        error_icon = " ",
        warn_icon = " ",
        info_icon = " ",
        hint_icon = " ",
      },

      init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      end,

      update = { "DiagnosticChanged", "BufEnter" },

      -- Ошибки (Raphael Red)
      {
        condition = function(self)
          return self.errors > 0
        end,
        provider = function(self)
          return self.error_icon .. self.errors .. " "
        end,
        hl = { fg = "raph_red", bold = true },
      },

      -- Предупреждения (Mikey Orange)
      {
        condition = function(self)
          return self.warnings > 0
        end,
        provider = function(self)
          return self.warn_icon .. self.warnings .. " "
        end,
        hl = { fg = "mikey_orange", bold = true },
      },

      -- Подсказки
      {
        condition = function(self)
          return self.hints > 0
        end,
        provider = function(self)
          return self.hint_icon .. self.hints .. " "
        end,
        hl = { fg = "concrete" },
      },

      -- Информация
      {
        condition = function(self)
          return self.info > 0
        end,
        provider = function(self)
          return self.info_icon .. self.info .. " "
        end,
        hl = { fg = "turtle_green" },
      },
    }

    -- LSP статус
    local LSPActive = {
      condition = conditions.lsp_attached,
      update = { "LspAttach", "LspDetach" },

      provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
          table.insert(names, server.name)
        end
        return " [" .. table.concat(names, " ") .. "] "
      end,
      hl = { fg = "turtle_green", bold = true },
    }

    -- Тип файла
    local FileType = {
      provider = function()
        local ft = vim.bo.filetype
        if ft == "" then
          return ""
        end
        return " " .. ft .. " "
      end,
      hl = { fg = "donnie_purple" },
    }

    -- Кодировка файла
    local FileEncoding = {
      provider = function()
        local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
        return " " .. enc:upper() .. " "
      end,
      hl = { fg = "fg_alt" },
    }

    -- Формат файла (unix/dos/mac)
    local FileFormat = {
      provider = function()
        local fmt = vim.bo.fileformat
        local symbols = {
          unix = " ",
          dos = " ",
          mac = " ",
        }
        return symbols[fmt] or fmt
      end,
      hl = { fg = "fg_alt" },
    }

    -- Имя файла с флагами
    local FileName = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,

      -- Иконка файла
      {
        provider = function(self)
          local filename = vim.fn.fnamemodify(self.filename, ":t")
          local extension = vim.fn.fnamemodify(self.filename, ":e")

          -- Попытка получить иконку через nvim-web-devicons
          local ok, devicons = pcall(require, "nvim-web-devicons")
          if ok then
            local icon, _ = devicons.get_icon(filename, extension, { default = true })
            return " " .. (icon or "") .. " "
          end
          return " "
        end,
        hl = { fg = "mikey_orange" },
      },

      -- Имя файла
      {
        provider = function(self)
          local filename = vim.fn.fnamemodify(self.filename, ":.")
          if filename == "" then
            return "[No Name]"
          end
          return filename
        end,
        hl = { fg = "white", bold = true },
      },

      -- Флаг модификации
      {
        condition = function()
          return vim.bo.modified
        end,
        provider = " ● ",
        hl = { fg = "ooze_green", bold = true },
      },

      -- Read-only флаг
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = "  ",
        hl = { fg = "raph_red" },
      },
    }

    -- Позиция курсора (Leo Blue - структура)
    local Ruler = {
      provider = " %l:%c ",
      hl = { fg = "leo_blue", bold = true },
    }

    -- Процент прокрутки
    local ScrollBar = {
      static = {
        sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
      },
      provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return " " .. self.sbar[i] .. " %P "
      end,
      hl = { fg = "ooze_green", bold = true },
    }

    -- Разделитель
    local Align = { provider = "%=" }
    local Space = { provider = " " }

    -- ============================================================================
    -- СБОРКА STATUSLINE
    -- ============================================================================

    local StatusLine = {
      ViMode,
      Space,
      FileName,
      Space,
      Git,
      Diagnostics,
      Align,
      LSPActive,
      FileType,
      FileEncoding,
      FileFormat,
      Space,
      Ruler,
      ScrollBar,
    }

    -- ============================================================================
    -- SETUP
    -- ============================================================================

    require("heirline").setup({
      statusline = StatusLine,
      opts = {
        colors = colors,
      },
    })
  end,
}
