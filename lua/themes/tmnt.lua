-- Eastman Comics - Kevin Eastman inspired theme
-- Черно-белая комикс-графика с зеленым акцентом

local M = {}

M.colors = {
  -- Черно-белая основа (как ink на бумаге)
  bg = "#212121",             
  bg_alt = "#252525",       
  bg_highlight = "#303030", 
  fg = "#d0d0d0",           -- Светло-серый текст
  fg_alt = "#808080",       -- Средний серый
  
  -- Ink colors (черные чернила)
  black = "#000000",        -- Абсолютный черный
  ink = "#0d0d0d",          -- Ink black
  shadow = "#2a2a2a",       -- Глубокая тень (светлее)
  
  -- Paper/light (белая бумага)
  white = "#ffffff",        -- Чистый белый
  paper = "#f5f5f5",        -- Бумага
  
  -- Turtle green (зеленый акцент черепашек)
  turtle_green = "#4ca64c", -- Основной зеленый
  neon_green = "#39ff14",   -- Неоновый зеленый
  dark_green = "#2d5016",   -- Темно-зеленый
  
  -- Urban colors (урбанистика)
  sewer_gray = "#4a4a4a",   -- Серый канализации
  rust = "#8b4513",         -- Ржавчина
  concrete = "#6a6a6a",     -- Бетон
  
  -- Accents
  main_accent = "#cd853f",       -- Оранжевый (повязки)
  second_accent = "#ffd700",       -- Желтый
  
  crimson = "#dc143c",
  royal_blue = "#4169e1",
  dark_orange = "#ff8c00",
  comics_purple = "#8b7ab8",
  none = "NONE"
}

M.setup = function()
  local c = M.colors
  
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  vim.o.background = "dark"
  vim.g.colors_name = "eastman-comics"
  
  local highlights = {
    -- Основные (чистая ч/б графика)
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg_alt },
    NormalNC = { fg = c.concrete, bg = c.bg },
    
    -- Курсор (зеленый как черепашки)
    Cursor = { fg = c.black, bg = c.neon_green },
    CursorLine = { bg = c.bg_highlight },
    CursorLineNr = { fg = c.turtle_green, bg = c.bg_highlight, bold = true },
    LineNr = { fg = c.sewer_gray },
    SignColumn = { bg = c.bg },
    
    -- Выделение (темно-зеленый)
    Visual = { bg = c.dark_green, fg = c.white },
    VisualNOS = { bg = c.dark_green },
    Search = { fg = c.black, bg = c.neon_green, bold = true },
    IncSearch = { fg = c.black, bg = c.second_accent, bold = true },
    
    -- Интерфейс
    StatusLine = { fg = c.white, bg = c.sewer_gray, bold = true },
    StatusLineNC = { fg = c.concrete, bg = c.bg_alt },
    VertSplit = { fg = c.sewer_gray, bg = c.bg },
    Pmenu = { fg = c.fg, bg = c.bg_alt },
    PmenuSel = { fg = c.black, bg = c.turtle_green, bold = true },
    PmenuSbar = { bg = c.shadow },
    PmenuThumb = { bg = c.turtle_green },
    
    -- Синтаксис - КОМИКС СТИЛЬ
    Comment = { fg = c.concrete, italic = true },
    
    -- Константы (белым - яркий свет)
    Constant = { fg = c.white },
    String = { fg = c.fg },
    Character = { fg = c.fg },
    Number = { fg = c.white, bold = true },
    Boolean = { fg = c.white, bold = true },
    Float = { fg = c.white },
    
    -- Ключевые слова - ЗЕЛЕНЫЕ (turtle power!)
    Keyword = { fg = c.turtle_green, bold = true },
    Function = { fg = c.royal_blue, bold = true },
    Identifier = { fg = c.fg },
    Statement = { fg = c.turtle_green, bold = true },
    Conditional = { fg = c.turtle_green, bold = true },
    Repeat = { fg = c.turtle_green, bold = true },
    Label = { fg = c.turtle_green },
    Operator = { fg = c.white },
    Exception = { fg = c.turtle_green, bold = true },
    
    -- Типы - БЕЛЫЕ (чистые линии)
    Type = { fg = c.white, bold = true },
    StorageClass = { fg = c.turtle_green },
    Structure = { fg = c.white, bold = true },
    Typedef = { fg = c.white },
    
    -- Препроцессор - ОРАНЖЕВЫЙ (как повязки)
    PreProc = { fg = c.main_accent },
    Include = { fg = c.main_accent },
    Define = { fg = c.main_accent },
    Macro = { fg = c.main_accent },
    PreCondit = { fg = c.main_accent },
    
    -- Специальные - зеленый акцент
    Special = { fg = c.neon_green },
    SpecialChar = { fg = c.neon_green },
    Tag = { fg = c.turtle_green },
    Delimiter = { fg = c.sewer_gray },
    SpecialComment = { fg = c.turtle_green, italic = true },
    Debug = { fg = c.neon_green },
    
    -- Ошибки (желтый/оранжевый предупреждения)
    Error = { fg = c.white, bg = c.rust, bold = true },
    ErrorMsg = { fg = c.main_accent, bold = true },
    WarningMsg = { fg = c.second_accent, bold = true },
    Todo = { fg = c.black, bg = c.second_accent, bold = true },
    
    -- Diff
    DiffAdd = { fg = c.turtle_green, bg = c.bg_highlight },
    DiffChange = { fg = c.second_accent, bg = c.bg_highlight },
    DiffDelete = { fg = c.rust, bg = c.bg_highlight },
    DiffText = { fg = c.white, bg = c.dark_green, bold = true },
    
    -- Git signs
    GitSignsAdd = { fg = c.turtle_green },
    GitSignsChange = { fg = c.second_accent },
    GitSignsDelete = { fg = c.rust },
    
    -- Treesitter - КОМИКС ГРАФИКА
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.white },
    ["@variable.parameter"] = { fg = c.comics_purple },
    ["@variable.member"] = { fg = c.dark_orange},
    
    ["@constant"] = { fg = c.white },
    ["@constant.builtin"] = { fg = c.white, bold = true },
    ["@constant.macro"] = { fg = c.main_accent },
    
    ["@module"] = { fg = c.white },
    ["@label"] = { fg = c.turtle_green },
    
    -- Функции - белые жирные линии
    ["@function"] = { fg = c.royal_blue, bold = true },
    ["@function.builtin"] = { fg = c.royal_blue, bold = true },
    ["@function.call"] = { fg = c.royal_blue },
    ["@function.macro"] = { fg = c.crimson},
    ["@function.method"] = { fg = c.royal_blue },
    ["@function.method.call"] = { fg = c.royal_blue},
    
    -- Ключевые слова - зеленые
    ["@keyword"] = { fg = c.crimson , bold = true  },
    ["@keyword.function"] = { fg = c.turtle_green, bold = true },
    ["@keyword.return"] = { fg = c.turtle_green, bold = true },
    ["@keyword.operator"] = { fg = c.turtle_green },
    ["@keyword.import"] = { fg = c.main_accent },
    ["@keyword.conditional"] = { fg = c.turtle_green, bold = true },
    ["@keyword.repeat"] = { fg = c.turtle_green, bold = true },
    
    -- Типы
    ["@type"] = { fg = c.white, bold = true },
    ["@type.builtin"] = { fg = c.white, bold = true },
    ["@type.definition"] = { fg = c.white, bold = true },
    ["@type.qualifier"] = { fg = c.turtle_green },
    
    -- Строки
    ["@string"] = { fg = c.fg },
    ["@string.escape"] = { fg = c.neon_green },
    ["@string.special"] = { fg = c.turtle_green },
    ["@string.regexp"] = { fg = c.main_accent },
    
    ["@character"] = { fg = c.fg },
    ["@number"] = { fg = c.white, bold = true },
    ["@boolean"] = { fg = c.white, bold = true },
    ["@float"] = { fg = c.white },
    
    -- Tags
    ["@tag"] = { fg = c.cold_grey, bold = true },
    ["@tag.attribute"] = { fg = c.grey },
    -- Операторы
    ["@operator"] = { fg = c.white },
    ["@punctuation.bracket"] = { fg = c.concrete },
    ["@punctuation.delimiter"] = { fg = c.concrete },
    ["@punctuation.special"] = { fg = c.turtle_green },
    
    ["@comment"] = { fg = c.concrete, italic = true },
    
    -- Markup (как в комиксах)
    ["@markup.strong"] = { fg = c.white, bold = true },
    ["@markup.italic"] = { fg = c.fg, italic = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = c.turtle_green, bold = true },
    ["@markup.link"] = { fg = c.main_accent, underline = true },
    ["@markup.list"] = { fg = c.turtle_green },
    
    -- LSP
    DiagnosticError = { fg = c.rust },
    DiagnosticWarn = { fg = c.second_accent },
    DiagnosticInfo = { fg = c.turtle_green },
    DiagnosticHint = { fg = c.concrete },
    
    DiagnosticUnderlineError = { undercurl = true, sp = c.rust },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.second_accent },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.turtle_green },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.concrete },
    
    -- Telescope
    TelescopeSelection = { fg = c.white, bg = c.dark_green, bold = true },
    TelescopeSelectionCaret = { fg = c.neon_green, bg = c.dark_green },
    TelescopeMatching = { fg = c.neon_green, bold = true },
    TelescopeBorder = { fg = c.sewer_gray },
    TelescopePromptPrefix = { fg = c.turtle_green },
    
    -- NvimTree
    NvimTreeFolderName = { fg = c.fg },
    NvimTreeFolderIcon = { fg = c.turtle_green },
    NvimTreeOpenedFolderName = { fg = c.white, bold = true },
    NvimTreeEmptyFolderName = { fg = c.concrete },
    NvimTreeRootFolder = { fg = c.turtle_green, bold = true },
    NvimTreeSpecialFile = { fg = c.main_accent },
    NvimTreeExecFile = { fg = c.white, bold = true },
    NvimTreeGitDirty = { fg = c.second_accent },
    NvimTreeGitNew = { fg = c.turtle_green },
    NvimTreeGitDeleted = { fg = c.rust },
    
    -- Floating windows
    FloatBorder = { fg = c.sewer_gray, bg = c.bg_alt },
    FloatTitle = { fg = c.turtle_green, bg = c.bg_alt, bold = true },
    
    -- Tabs
    -- TabLine = { fg = c.concrete, bg = c.bg_alt },
    -- TabLineSel = { fg = c.white, bg = c.sewer_gray, bold = true },
    -- TabLineFill = { bg = c.bg },
  }
  
  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
