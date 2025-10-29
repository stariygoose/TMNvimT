return {
  "rebelot/heirline.nvim",
  config = function()
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")
    
    -- Простой statusline
    local statusline = {
      -- Режим vim
      {
        provider = function()
          local mode_names = {
            n = "NORMAL",
            i = "INSERT",
            v = "VISUAL",
            V = "V-LINE",
            ["\22"] = "V-BLOCK",
            c = "COMMAND",
            R = "REPLACE",
            t = "TERMINAL",
          }
          return " " .. (mode_names[vim.fn.mode()] or "UNKNOWN") .. " "
        end,
        hl = { fg = "black", bg = "cyan", bold = true },
      },
      
      -- Имя файла
      {
        provider = function()
          return " " .. vim.fn.expand("%:t")
        end,
      },
      
      -- Разделитель (заполняет пространство)
      { provider = "%=" },
      
      -- Позиция курсора
      {
        provider = " %l:%c ",
      },
    }
    
    require("heirline").setup({
      statusline = statusline,
    })
  end,
}
