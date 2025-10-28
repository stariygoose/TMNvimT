-- Raphael - Бунтарь, красные тона
-- "Ярость и страсть"

local M = {}

M.colors = {
  -- Основа
  bg = "#1a1a1a",
  bg_alt = "#252525",
  bg_highlight = "#303030",
  fg = "#d0d0d0",
  fg_alt = "#808080",
  
  black = "#000000",
  white = "#ffffff",
  
  -- Raphael colors (красный - гнев)
  raph_red = "#dc143c",      -- Малиновый красный (сай)
  fire_red = "#ff4500",      -- Огненный красный
  deep_red = "#8b0000",      -- Темно-красный
  hot_pink = "#ff69b4",      -- Горячий розовый
  
  -- Дополнительные
  shadow = "#2a2a2a",
  concrete = "#6a6a6a",
  brick = "#b22222",
  
  none = "NONE"
}

M.setup = function()
  local c = M.colors
  
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  vim.o.background = "dark"
  vim.g.colors_name = "raphael"
  
  local highlights = {
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg_alt },
    NormalNC = { fg = c.concrete, bg = c.bg },
    
    Cursor = { fg = c.black, bg = c.fire_red },
    CursorLine = { bg = c.bg_highlight },
    CursorLineNr = { fg = c.raph_red, bg = c.bg_highlight, bold = true },
    LineNr = { fg = c.shadow },
    SignColumn = { bg = c.bg },
    
    Visual = { bg = c.deep_red, fg = c.white },
    VisualNOS = { bg = c.deep_red },
    Search = { fg = c.black, bg = c.fire_red, bold = true },
    IncSearch = { fg = c.black, bg = c.hot_pink, bold = true },
    
    StatusLine = { fg = c.white, bg = c.raph_red, bold = true },
    StatusLineNC = { fg = c.concrete, bg = c.shadow },
    VertSplit = { fg = c.shadow, bg = c.bg },
    Pmenu = { fg = c.fg, bg = c.bg_alt },
    PmenuSel = { fg = c.white, bg = c.raph_red, bold = true },
    PmenuSbar = { bg = c.shadow },
    PmenuThumb = { bg = c.raph_red },
    
    Comment = { fg = c.concrete, italic = true },
    
    Constant = { fg = c.white },
    String = { fg = c.fg },
    Character = { fg = c.fg },
    Number = { fg = c.white, bold = true },
    Boolean = { fg = c.white, bold = true },
    Float = { fg = c.white },
    
    Keyword = { fg = c.raph_red, bold = true },
    Function = { fg = c.white, bold = true },
    Identifier = { fg = c.fg },
    Statement = { fg = c.raph_red, bold = true },
    Conditional = { fg = c.raph_red, bold = true },
    Repeat = { fg = c.raph_red, bold = true },
    Label = { fg = c.raph_red },
    Operator = { fg = c.white },
    Exception = { fg = c.raph_red, bold = true },
    
    Type = { fg = c.white, bold = true },
    StorageClass = { fg = c.raph_red },
    Structure = { fg = c.white, bold = true },
    Typedef = { fg = c.white },
    
    PreProc = { fg = c.fire_red },
    Include = { fg = c.fire_red },
    Define = { fg = c.fire_red },
    Macro = { fg = c.fire_red },
    PreCondit = { fg = c.fire_red },
    
    Special = { fg = c.hot_pink },
    SpecialChar = { fg = c.hot_pink },
    Tag = { fg = c.raph_red },
    Delimiter = { fg = c.concrete },
    SpecialComment = { fg = c.raph_red, italic = true },
    Debug = { fg = c.hot_pink },
    
    Error = { fg = c.white, bg = c.deep_red, bold = true },
    ErrorMsg = { fg = c.fire_red, bold = true },
    WarningMsg = { fg = c.hot_pink, bold = true },
    Todo = { fg = c.black, bg = c.fire_red, bold = true },
    
    DiffAdd = { fg = c.raph_red, bg = c.bg_highlight },
    DiffChange = { fg = c.hot_pink, bg = c.bg_highlight },
    DiffDelete = { fg = c.brick, bg = c.bg_highlight },
    DiffText = { fg = c.white, bg = c.deep_red, bold = true },
    
    GitSignsAdd = { fg = c.raph_red },
    GitSignsChange = { fg = c.hot_pink },
    GitSignsDelete = { fg = c.brick },
    
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.white },
    ["@variable.parameter"] = { fg = c.fg },
    ["@variable.member"] = { fg = c.fg },
    
    ["@constant"] = { fg = c.white },
    ["@constant.builtin"] = { fg = c.white, bold = true },
    ["@constant.macro"] = { fg = c.fire_red },
    
    ["@module"] = { fg = c.white },
    ["@label"] = { fg = c.raph_red },
    
    ["@function"] = { fg = c.white, bold = true },
    ["@function.builtin"] = { fg = c.white, bold = true },
    ["@function.call"] = { fg = c.white },
    ["@function.macro"] = { fg = c.fire_red },
    ["@function.method"] = { fg = c.white },
    ["@function.method.call"] = { fg = c.white },
    
    ["@keyword"] = { fg = c.raph_red, bold = true },
    ["@keyword.function"] = { fg = c.raph_red, bold = true },
    ["@keyword.return"] = { fg = c.raph_red, bold = true },
    ["@keyword.operator"] = { fg = c.raph_red },
    ["@keyword.import"] = { fg = c.fire_red },
    ["@keyword.conditional"] = { fg = c.raph_red, bold = true },
    ["@keyword.repeat"] = { fg = c.raph_red, bold = true },
    
    ["@type"] = { fg = c.white, bold = true },
    ["@type.builtin"] = { fg = c.white, bold = true },
    ["@type.definition"] = { fg = c.white, bold = true },
    ["@type.qualifier"] = { fg = c.raph_red },
    
    ["@string"] = { fg = c.fg },
    ["@string.escape"] = { fg = c.hot_pink },
    ["@string.special"] = { fg = c.raph_red },
    ["@string.regexp"] = { fg = c.fire_red },
    
    ["@character"] = { fg = c.fg },
    ["@number"] = { fg = c.white, bold = true },
    ["@boolean"] = { fg = c.white, bold = true },
    ["@float"] = { fg = c.white },
    
    ["@operator"] = { fg = c.white },
    ["@punctuation.bracket"] = { fg = c.concrete },
    ["@punctuation.delimiter"] = { fg = c.concrete },
    ["@punctuation.special"] = { fg = c.raph_red },
    
    ["@comment"] = { fg = c.concrete, italic = true },
    
    ["@markup.strong"] = { fg = c.white, bold = true },
    ["@markup.italic"] = { fg = c.fg, italic = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = c.raph_red, bold = true },
    ["@markup.link"] = { fg = c.fire_red, underline = true },
    ["@markup.list"] = { fg = c.raph_red },
    
    DiagnosticError = { fg = c.brick },
    DiagnosticWarn = { fg = c.fire_red },
    DiagnosticInfo = { fg = c.raph_red },
    DiagnosticHint = { fg = c.concrete },
    
    DiagnosticUnderlineError = { undercurl = true, sp = c.brick },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.fire_red },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.raph_red },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.concrete },
    
    TelescopeSelection = { fg = c.white, bg = c.deep_red, bold = true },
    TelescopeSelectionCaret = { fg = c.fire_red, bg = c.deep_red },
    TelescopeMatching = { fg = c.fire_red, bold = true },
    TelescopeBorder = { fg = c.shadow },
    TelescopePromptPrefix = { fg = c.raph_red },
    
    NvimTreeFolderName = { fg = c.fg },
    NvimTreeFolderIcon = { fg = c.raph_red },
    NvimTreeOpenedFolderName = { fg = c.white, bold = true },
    NvimTreeEmptyFolderName = { fg = c.concrete },
    NvimTreeRootFolder = { fg = c.raph_red, bold = true },
    NvimTreeSpecialFile = { fg = c.fire_red },
    NvimTreeExecFile = { fg = c.white, bold = true },
    NvimTreeGitDirty = { fg = c.fire_red },
    NvimTreeGitNew = { fg = c.raph_red },
    NvimTreeGitDeleted = { fg = c.brick },
    
    FloatBorder = { fg = c.shadow, bg = c.bg_alt },
    FloatTitle = { fg = c.raph_red, bg = c.bg_alt, bold = true },
    
    TabLine = { fg = c.concrete, bg = c.bg_alt },
    TabLineSel = { fg = c.white, bg = c.raph_red, bold = true },
    TabLineFill = { bg = c.bg },
  }
  
  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
