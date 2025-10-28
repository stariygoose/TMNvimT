-- Gothic Contrast v3 - Только ч/б + красный
-- Убран фиолетовый акцент

local M = {}

M.colors = {
  -- Основа
  bg = "#0d0d0d",
  bg_alt = "#181818",
  bg_highlight = "#252525",
  fg = "#c0c0c0",
  fg_alt = "#808080",
  
  -- Акценты (только красно-белые)
  white = "#ffffff",
  red = "#ff1744",
  crimson = "#c41e3a",
  blood = "#6b0000",
  
  -- Дополнительные
  ghost = "#d0d0d0",
  shadow = "#2d2d2d",
  ash = "#909090",
  
  none = "NONE"
}

M.setup = function()
  local c = M.colors
  
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  vim.o.background = "dark"
  vim.g.colors_name = "gothic-contrast-v3"
  
  local highlights = {
    -- Основные
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg_alt },
    NormalNC = { fg = c.fg_alt, bg = c.bg },
    
    -- Курсор и строки
    Cursor = { fg = c.bg, bg = c.red },
    CursorLine = { bg = c.bg_highlight },
    CursorLineNr = { fg = c.red, bg = c.bg_highlight, bold = true },
    LineNr = { fg = c.shadow },
    SignColumn = { bg = c.bg },
    
    -- Выделение и поиск
    Visual = { bg = c.blood, fg = c.white },
    VisualNOS = { bg = c.blood },
    Search = { fg = c.bg, bg = c.red, bold = true },
    IncSearch = { fg = c.bg, bg = c.white, bold = true },
    
    -- Интерфейс
    StatusLine = { fg = c.white, bg = c.shadow, bold = true },
    StatusLineNC = { fg = c.ash, bg = c.bg_alt },
    VertSplit = { fg = c.shadow, bg = c.bg },
    Pmenu = { fg = c.fg, bg = c.bg_alt },
    PmenuSel = { fg = c.white, bg = c.crimson, bold = true },
    PmenuSbar = { bg = c.shadow },
    PmenuThumb = { bg = c.red },
    
    -- Синтаксис
    Comment = { fg = c.ash, italic = true },
    
    -- Строки и константы
    Constant = { fg = c.white },
    String = { fg = c.ghost },
    Character = { fg = c.ghost },
    Number = { fg = c.white, bold = true },
    Boolean = { fg = c.white, bold = true },
    Float = { fg = c.white },
    
    -- Ключевые слова - КРАСНЫЕ
    Keyword = { fg = c.red, bold = true },
    Function = { fg = c.white, bold = true },
    Identifier = { fg = c.fg },
    Statement = { fg = c.red, bold = true },
    Conditional = { fg = c.red, bold = true },
    Repeat = { fg = c.red, bold = true },
    Label = { fg = c.crimson },
    Operator = { fg = c.white },
    Exception = { fg = c.red, bold = true },
    
    -- Типы - БЕЛЫЕ
    Type = { fg = c.white, bold = true },
    StorageClass = { fg = c.red },
    Structure = { fg = c.white, bold = true },
    Typedef = { fg = c.white },
    
    -- Препроцессор - теперь КРАСНЫЙ (без фиолетового)
    PreProc = { fg = c.red },
    Include = { fg = c.red },
    Define = { fg = c.red },
    Macro = { fg = c.red },
    PreCondit = { fg = c.red },
    
    -- Специальные
    Special = { fg = c.crimson },
    SpecialChar = { fg = c.red },
    Tag = { fg = c.red },
    Delimiter = { fg = c.fg_alt },
    SpecialComment = { fg = c.crimson, italic = true },
    Debug = { fg = c.red },
    
    -- Ошибки и предупреждения
    Error = { fg = c.white, bg = c.crimson, bold = true },
    ErrorMsg = { fg = c.red, bold = true },
    WarningMsg = { fg = c.ghost, bold = true },
    Todo = { fg = c.bg, bg = c.red, bold = true },
    
    -- Diff
    DiffAdd = { fg = c.white, bg = c.shadow },
    DiffChange = { fg = c.ghost, bg = c.bg_alt },
    DiffDelete = { fg = c.red, bg = c.blood },
    DiffText = { fg = c.white, bg = c.crimson, bold = true },
    
    -- Git signs
    GitSignsAdd = { fg = c.ghost },
    GitSignsChange = { fg = c.ash },
    GitSignsDelete = { fg = c.red },
    
    -- Treesitter
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.white },
    ["@variable.parameter"] = { fg = c.ghost },
    ["@variable.member"] = { fg = c.fg },
    
    ["@constant"] = { fg = c.white },
    ["@constant.builtin"] = { fg = c.white, bold = true },
    ["@constant.macro"] = { fg = c.red },
    
    ["@module"] = { fg = c.white },
    ["@label"] = { fg = c.crimson },
    
    -- Функции
    ["@function"] = { fg = c.white, bold = true },
    ["@function.builtin"] = { fg = c.white, bold = true },
    ["@function.call"] = { fg = c.white },
    ["@function.macro"] = { fg = c.red },
    ["@function.method"] = { fg = c.white },
    ["@function.method.call"] = { fg = c.white },
    
    -- Ключевые слова
    ["@keyword"] = { fg = c.red, bold = true },
    ["@keyword.function"] = { fg = c.red, bold = true },
    ["@keyword.return"] = { fg = c.red, bold = true },
    ["@keyword.operator"] = { fg = c.red },
    ["@keyword.import"] = { fg = c.red },
    ["@keyword.conditional"] = { fg = c.red, bold = true },
    ["@keyword.repeat"] = { fg = c.red, bold = true },
    
    -- Типы
    ["@type"] = { fg = c.white, bold = true },
    ["@type.builtin"] = { fg = c.white, bold = true },
    ["@type.definition"] = { fg = c.white, bold = true },
    ["@type.qualifier"] = { fg = c.red },
    
    -- Строки
    ["@string"] = { fg = c.ghost },
    ["@string.escape"] = { fg = c.red },
    ["@string.special"] = { fg = c.crimson },
    ["@string.regexp"] = { fg = c.red },
    
    ["@character"] = { fg = c.ghost },
    ["@number"] = { fg = c.white, bold = true },
    ["@boolean"] = { fg = c.white, bold = true },
    ["@float"] = { fg = c.white },
    
    -- Операторы и пунктуация
    ["@operator"] = { fg = c.white },
    ["@punctuation.bracket"] = { fg = c.fg_alt },
    ["@punctuation.delimiter"] = { fg = c.fg_alt },
    ["@punctuation.special"] = { fg = c.red },
    
    ["@comment"] = { fg = c.ash, italic = true },
    
    -- Markup (Markdown)
    ["@markup.strong"] = { fg = c.white, bold = true },
    ["@markup.italic"] = { fg = c.ghost, italic = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = c.red, bold = true },
    ["@markup.link"] = { fg = c.red, underline = true },
    ["@markup.list"] = { fg = c.red },
    
    -- LSP
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.ghost },
    DiagnosticInfo = { fg = c.ash },
    DiagnosticHint = { fg = c.fg_alt },
    
    DiagnosticUnderlineError = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.ghost },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.ash },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.fg_alt },
    
    -- Telescope
    TelescopeSelection = { fg = c.white, bg = c.blood, bold = true },
    TelescopeSelectionCaret = { fg = c.red, bg = c.blood },
    TelescopeMatching = { fg = c.red, bold = true },
    TelescopeBorder = { fg = c.shadow },
    TelescopePromptPrefix = { fg = c.red },
    
    -- NvimTree
    NvimTreeFolderName = { fg = c.ghost },
    NvimTreeFolderIcon = { fg = c.ash },
    NvimTreeOpenedFolderName = { fg = c.white, bold = true },
    NvimTreeEmptyFolderName = { fg = c.ash },
    NvimTreeRootFolder = { fg = c.red, bold = true },
    NvimTreeSpecialFile = { fg = c.red },
    NvimTreeExecFile = { fg = c.white, bold = true },
    NvimTreeGitDirty = { fg = c.crimson },
    NvimTreeGitNew = { fg = c.white },
    NvimTreeGitDeleted = { fg = c.red },
    
    -- Floating windows
    FloatBorder = { fg = c.shadow, bg = c.bg_alt },
    FloatTitle = { fg = c.white, bg = c.bg_alt, bold = true },
    
    -- Tabs
    TabLine = { fg = c.ash, bg = c.bg_alt },
    TabLineSel = { fg = c.white, bg = c.shadow, bold = true },
    TabLineFill = { bg = c.bg },
  }
  
  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
