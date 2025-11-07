-- Eastman Comics - Kevin Eastman inspired theme
-- Pure black & white comic graphics with turtle bandana accents

local M = {}

M.colors = {
	-- === BASE COLORS (Ink & Paper) ===
	-- Backgrounds
	bg = "#212121", -- Deep ink black
	bg_alt = "#1a1a1a", -- Alternative bg
	bg_highlight = "#252525", -- Highlighted lines
	shadow = "#2a2a2a", -- Deep shadows

	-- Foregrounds
	fg = "#e0e0e0", -- Main text (paper white)
	fg_alt = "#808080", -- Secondary text

	-- Pure contrast
	black = "#000000", -- Absolute black
	white = "#ffffff", -- Pure white

	-- === URBAN COLORS (Sewer atmosphere) ===
	concrete = "#6a6a6a", -- Concrete gray
	sewer_gray = "#404040", -- Sewer darkness
	rust = "#5a2a1a", -- Deep rust (danger)

	-- === TURTLE GREEN (Ooze/Mutation) ===
	ooze_green = "#7fff00", -- Radioactive ooze
	turtle_green = "#4a9b4a", -- Turtle skin
	shadow_green = "#1a3d1a", -- Dark sewers

	-- === BANDANA COLORS (Turtle Power!) ===
	leo_blue = "#5B9BD5", -- Leonardo: Leader, commands (светлее!)
	raph_red = "#dc143c", -- Raphael: Aggression, action
	donnie_purple = "#9370db", -- Donatello: Creativity, content (строки!)
	mikey_orange = "#ff8c00", -- Michelangelo: Tech, tools (свойства!)

	-- === UTILITY ===
	warning = "#cd7f32", -- Bronze warning

	none = "NONE",
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
		-- ============================================================================
		-- EDITOR UI (Pure B&W comic style)
		-- ============================================================================

		Normal = { fg = c.fg, bg = c.bg },
		NormalFloat = { fg = c.fg, bg = c.bg_alt },
		NormalNC = { fg = c.fg_alt, bg = c.bg },

		-- Cursor (Radioactive ooze!)
		Cursor = { fg = c.black, bg = c.ooze_green },
		CursorLine = { bg = c.bg_highlight },
		CursorLineNr = { fg = c.turtle_green, bg = c.bg_highlight, bold = true },
		CursorColumn = { bg = c.bg_highlight },
		ColorColumn = { bg = c.bg_highlight },

		LineNr = { fg = c.sewer_gray },
		SignColumn = { bg = c.bg },

		-- Selection (turtle green shadow)
		Visual = { bg = c.shadow_green, fg = c.white },
		VisualNOS = { bg = c.shadow_green },
		Search = { fg = c.black, bg = c.ooze_green, bold = true },
		IncSearch = { fg = c.black, bg = c.donnie_purple, bold = true },
		CurSearch = { fg = c.black, bg = c.donnie_purple, bold = true },

		-- UI Elements
		StatusLine = { fg = c.white, bg = c.sewer_gray, bold = true },
		StatusLineNC = { fg = c.concrete, bg = c.bg_alt },
		VertSplit = { fg = c.sewer_gray, bg = c.bg },
		WinSeparator = { fg = c.sewer_gray, bg = c.bg },

		-- Popup Menu
		Pmenu = { fg = c.fg, bg = c.bg_highlight },
		PmenuSel = { fg = c.black, bg = c.turtle_green, bold = true },
		PmenuSbar = { bg = c.shadow },
		PmenuThumb = { bg = c.turtle_green },

		-- Tabs
		TabLineFill = { fg = c.concrete, bg = c.bg },

		-- Background
		BufferTabpageFill = { bg = c.bg },
		BufferDefaultCurrentTarget = { fg = c.leo_blue, bold = true },

		-- Current (активный буфер)
		BufferCurrent = { fg = c.leo_blue, bold = true },
		BufferCurrentIndex = { fg = c.leo_blue },
		BufferCurrentMod = { fg = c.leo_blue, bold = true },
		BufferCurrentSign = { fg = c.leo_blue },
		BufferCurrentTarget = { fg = c.leo_blue, bold = true },

		-- Visible (видимый буфер)
		BufferVisible = { fg = c.concrete },
		BufferVisibleIndex = { fg = c.mikey_orange },
		BufferVisibleMod = { fg = c.concrete },
		BufferVisibleSign = { fg = c.concrete },

		-- Inactive (неактивные буферы)
		BufferInactive = { fg = c.concrete },
		BufferInactiveIndex = { fg = c.mikey_orange },
		BufferInactiveMod = { fg = c.concrete },
		BufferInactiveSign = { fg = c.concrete },

		-- Errors в АКТИВНОМ буфере
		BufferCurrentERROR = { fg = c.raph_red, bold = true, italic = true },
		BufferCurrentERRORSign = { fg = c.raph_red },

		-- Errors в НЕАКТИВНОМ буфере (чтобы ошибки были видны!)
		BufferInactiveERROR = { fg = c.raph_red }, -- Подсвечиваем красным
		BufferInactiveERRORSign = { fg = c.raph_red }, -- Иконка тоже красная

		-- Errors в ВИДИМОМ буфере
		BufferVisibleERROR = { fg = c.raph_red },
		BufferVisibleERRORSign = { fg = c.raph_red },

		-- Warnings в АКТИВНОМ буфере
		BufferCurrentWARN = { fg = c.mikey_orange, bold = true, italic = true },
		BufferCurrentWARNSign = { fg = c.mikey_orange },

		-- Warnings в НЕАКТИВНОМ буфере (чтобы варнинги были видны!)
		BufferInactiveWARN = { fg = c.mikey_orange }, -- Подсвечиваем оранжевым
		BufferInactiveWARNSign = { fg = c.mikey_orange }, -- Иконка тоже оранжевая

		-- Warnings в ВИДИМОМ буфере
		BufferVisibleWARN = { fg = c.mikey_orange },
		BufferVisibleWARNSign = { fg = c.mikey_orange },

		-- Hints
		BufferCurrentHINT = { fg = c.leo_blue },
		BufferCurrentHINTSign = { fg = c.leo_blue },

		-- Info
		BufferCurrentINFO = { fg = c.leo_blue },
		BufferCurrentINFOSign = { fg = c.leo_blue },

		FloatBorder = { fg = c.sewer_gray, bg = c.bg_alt },
		FloatTitle = { fg = c.turtle_green, bg = c.bg_alt, bold = true },

		-- Messages
		ErrorMsg = { fg = c.raph_red, bold = true },
		WarningMsg = { fg = c.warning },
		ModeMsg = { fg = c.turtle_green, bold = true },
		MoreMsg = { fg = c.turtle_green },
		Question = { fg = c.turtle_green },

		MatchParen = { fg = c.ooze_green, bold = true, underline = true },
		NonText = { fg = c.sewer_gray },
		SpecialKey = { fg = c.sewer_gray },
		Whitespace = { fg = c.shadow },

		-- ============================================================================
		-- SYNTAX BASE (B&W foundation)
		-- ============================================================================

		Comment = { fg = c.concrete, italic = true },

		-- Constants (Mikey - technical values)
		Constant = { fg = c.mikey_orange },
		String = { fg = c.donnie_purple },
		Character = { fg = c.donnie_purple },
		Number = { fg = c.donnie_purple, bold = true },
		Boolean = { fg = c.raph_red, bold = true },
		Float = { fg = c.donnie_purple },

		-- Identifiers
		Identifier = { fg = c.fg },
		Function = { fg = c.leo_blue, bold = true },

		-- Statements (Raph - action words!)
		Statement = { fg = c.raph_red, bold = true },
		Conditional = { fg = c.raph_red, bold = true },
		Repeat = { fg = c.raph_red, bold = true },
		Label = { fg = c.raph_red },
		Operator = { fg = c.raph_red },
		Keyword = { fg = c.raph_red, bold = true },
		Exception = { fg = c.raph_red, bold = true },

		-- Types (Leo - structure)
		Type = { fg = c.leo_blue, bold = true },
		StorageClass = { fg = c.raph_red },
		Structure = { fg = c.leo_blue, bold = true },
		Typedef = { fg = c.leo_blue },

		-- Preprocessor (Mikey - external tools)
		PreProc = { fg = c.mikey_orange },
		Include = { fg = c.mikey_orange },
		Define = { fg = c.mikey_orange },
		Macro = { fg = c.mikey_orange },
		PreCondit = { fg = c.mikey_orange },

		-- Special (Ooze - mutations!)
		Special = { fg = c.ooze_green },
		SpecialChar = { fg = c.ooze_green },
		Tag = { fg = c.fg, bold = true },
		Delimiter = { fg = c.concrete },
		SpecialComment = { fg = c.turtle_green, italic = true },
		Debug = { fg = c.ooze_green },

		Error = { fg = c.white, bg = c.raph_red, bold = true },
		Todo = { fg = c.black, bg = c.mikey_orange, bold = true },
		Underlined = { underline = true },

		-- ============================================================================
		-- TREESITTER (Turtle Power!)
		-- ============================================================================

		-- Variables (paper white)
		["@variable"] = { fg = c.fg },
		["@variable.builtin"] = { fg = c.white },
		["@variable.parameter"] = { fg = c.fg },
		["@variable.member"] = { fg = c.mikey_orange }, -- Mikey: object properties

		-- Constants (Mikey - technical settings)
		["@constant"] = { fg = c.mikey_orange },
		["@constant.builtin"] = { fg = c.mikey_orange, bold = true },
		["@constant.macro"] = { fg = c.mikey_orange },

		["@module"] = { fg = c.mikey_orange },
		["@label"] = { fg = c.raph_red },

		-- Functions (Leo - commands of the leader!)
		["@function"] = { fg = c.leo_blue, bold = true },
		["@function.builtin"] = { fg = c.leo_blue, bold = true },
		["@function.call"] = { fg = c.leo_blue },
		["@function.macro"] = { fg = c.mikey_orange },
		["@function.method"] = { fg = c.leo_blue, bold = true },
		["@function.method.call"] = { fg = c.leo_blue },

		-- Keywords (Raph - aggressive action!)
		["@keyword"] = { fg = c.raph_red, bold = true },
		["@keyword.function"] = { fg = c.raph_red, bold = true },
		["@keyword.return"] = { fg = c.raph_red, bold = true },
		["@keyword.operator"] = { fg = c.raph_red },
		["@keyword.import"] = { fg = c.mikey_orange }, -- Mikey: external tools
		["@keyword.export"] = { fg = c.mikey_orange },
		["@keyword.conditional"] = { fg = c.raph_red, bold = true },
		["@keyword.repeat"] = { fg = c.raph_red, bold = true },
		["@keyword.modifier"] = { fg = c.raph_red },

		-- Types (Leo - organized structure)
		["@type"] = { fg = c.leo_blue, bold = true },
		["@type.builtin"] = { fg = c.leo_blue, bold = true },
		["@type.definition"] = { fg = c.leo_blue, bold = true },
		["@type.qualifier"] = { fg = c.raph_red },

		-- Strings (Donnie - creative content!)
		["@string"] = { fg = c.donnie_purple },
		["@string.escape"] = { fg = c.ooze_green }, -- Ooze mutations!
		["@string.special"] = { fg = c.ooze_green },
		["@string.regexp"] = { fg = c.donnie_purple, italic = true },

		["@character"] = { fg = c.donnie_purple },
		["@number"] = { fg = c.donnie_purple, bold = true },
		["@boolean"] = { fg = c.raph_red, bold = true }, -- Raph: true/false decisiveness
		["@float"] = { fg = c.donnie_purple },

		-- Operators (Raph - direct action!)
		["@operator"] = { fg = c.raph_red },
		["@punctuation.bracket"] = { fg = c.white },
		["@punctuation.delimiter"] = { fg = c.concrete },
		["@punctuation.special"] = { fg = c.ooze_green },

		["@comment"] = { fg = c.concrete, italic = true },

		-- Tags (white outlines like comic panels)
		["@tag"] = { fg = c.white, bold = true },
		["@tag.attribute"] = { fg = c.mikey_orange },
		["@tag.delimiter"] = { fg = c.concrete },

		-- Properties (Mikey - technical parameters)
		["@property"] = { fg = c.mikey_orange },

		-- Constructors
		["@constructor"] = { fg = c.leo_blue, bold = true },

		-- Markup (comic book style!)
		["@markup.strong"] = { fg = c.white, bold = true },
		["@markup.italic"] = { fg = c.fg, italic = true },
		["@markup.underline"] = { underline = true },
		["@markup.strike"] = { strikethrough = true },
		["@markup.heading"] = { fg = c.leo_blue, bold = true },
		["@markup.link"] = { fg = c.mikey_orange, underline = true },
		["@markup.link.url"] = { fg = c.concrete, underline = true },
		["@markup.list"] = { fg = c.raph_red },
		["@markup.list.checked"] = { fg = c.turtle_green },
		["@markup.list.unchecked"] = { fg = c.concrete },
		["@markup.raw"] = { fg = c.donnie_purple },
		["@markup.quote"] = { fg = c.concrete, italic = true },

		-- ============================================================================
		-- LSP
		-- ============================================================================

		DiagnosticError = { fg = c.raph_red },
		DiagnosticWarn = { fg = c.warning },
		DiagnosticInfo = { fg = c.turtle_green },
		DiagnosticHint = { fg = c.concrete },

		DiagnosticUnderlineError = { undercurl = true, sp = c.raph_red },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.turtle_green },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.concrete },

		DiagnosticVirtualTextError = { fg = c.raph_red, italic = true },
		DiagnosticVirtualTextWarn = { fg = c.warning, italic = true },
		DiagnosticVirtualTextInfo = { fg = c.turtle_green, italic = true },
		DiagnosticVirtualTextHint = { fg = c.concrete, italic = true },

		-- LSP Semantic
		["@lsp.type.class"] = { fg = c.leo_blue, bold = true },
		["@lsp.type.decorator"] = { fg = c.mikey_orange },
		["@lsp.type.enum"] = { fg = c.leo_blue, bold = true },
		["@lsp.type.enumMember"] = { fg = c.mikey_orange },
		["@lsp.type.function"] = { fg = c.leo_blue, bold = true },
		["@lsp.type.interface"] = { fg = c.leo_blue, bold = true },
		["@lsp.type.macro"] = { fg = c.mikey_orange },
		["@lsp.type.method"] = { fg = c.leo_blue },
		["@lsp.type.namespace"] = { fg = c.mikey_orange },
		["@lsp.type.parameter"] = { fg = c.fg },
		["@lsp.type.property"] = { fg = c.mikey_orange },
		["@lsp.type.struct"] = { fg = c.leo_blue, bold = true },
		["@lsp.type.type"] = { fg = c.leo_blue, bold = true },
		["@lsp.type.typeParameter"] = { fg = c.leo_blue },
		["@lsp.type.variable"] = { fg = c.fg },

		-- ============================================================================
		-- GIT (Turtle victory = green, conflict = rust)
		-- ============================================================================
		DiffAdd = { fg = c.white, bg = c.turtle_green },
		TelescopePreviewLine = { fg = c.white, bg = c.turtle_green },
		TelescopePreviewMatch = { fg = c.white, bg = c.turtle_green },
		DiffChange = { fg = c.white, bg = c.mikey_orange },
		DiffDelete = { fg = c.white, bg = c.raph_red },
		DiffText = { fg = c.white, bold = true },

		GitSignsAdd = { fg = c.turtle_green },
		GitSignsChange = { fg = c.warning },
		GitSignsDelete = { fg = c.rust },
		GitSignsCurrentLineBlame = { fg = c.sewer_gray, italic = true },

		-- ============================================================================
		-- TELESCOPE
		-- ============================================================================

		TelescopeNormal = { fg = c.fg, bg = c.bg_alt },
		TelescopeBorder = { fg = c.sewer_gray, bg = c.bg_alt },
		TelescopePromptNormal = { fg = c.fg, bg = c.bg_alt },
		TelescopePromptBorder = { fg = c.sewer_gray, bg = c.bg_alt },
		TelescopePromptTitle = { fg = c.turtle_green, bold = true },
		TelescopePromptPrefix = { fg = c.turtle_green, bold = true },
		TelescopeSelection = { fg = c.white, bg = c.shadow_green, bold = true },
		TelescopeSelectionCaret = { fg = c.ooze_green, bg = c.shadow_green, bold = true },
		TelescopeMultiSelection = { fg = c.turtle_green },
		TelescopeMatching = { fg = c.ooze_green, bold = true },

		-- ============================================================================
		-- NVIM-TREE
		-- ============================================================================

		NvimTreeNormal = { fg = c.fg, bg = c.bg },
		NvimTreeFolderName = { fg = c.fg },
		NvimTreeFolderIcon = { fg = c.turtle_green },
		NvimTreeOpenedFolderName = { fg = c.white, bold = true },
		NvimTreeEmptyFolderName = { fg = c.concrete },
		NvimTreeRootFolder = { fg = c.turtle_green, bold = true },
		NvimTreeSpecialFile = { fg = c.mikey_orange },
		NvimTreeExecFile = { fg = c.leo_blue, bold = true },
		NvimTreeImageFile = { fg = c.donnie_purple },
		NvimTreeSymlink = { fg = c.leo_blue, underline = true },

		NvimTreeGitDirty = { fg = c.warning },
		NvimTreeGitStaged = { fg = c.turtle_green },
		NvimTreeGitMerge = { fg = c.raph_red },
		NvimTreeGitRenamed = { fg = c.warning },
		NvimTreeGitNew = { fg = c.turtle_green },
		NvimTreeGitDeleted = { fg = c.rust },

		NvimTreeIndentMarker = { fg = c.sewer_gray },
		NvimTreeOpenedHL = { fg = c.leo_blue, bold = true },

		-- NvimTreeLspDiagnosticsError = { fg = c.white, bg = c.raph_red },
		-- NvimTreeLspDiagnosticsWarning = { fg = c.white, bg = c.mikey_orange },

		-- ============================================================================
		-- CMP (Autocompletion)
		-- ============================================================================

		CmpItemAbbrMatch = { fg = c.ooze_green, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = c.turtle_green },
		CmpItemKindFunction = { fg = c.leo_blue },
		CmpItemKindMethod = { fg = c.leo_blue },
		CmpItemKindVariable = { fg = c.fg },
		CmpItemKindKeyword = { fg = c.raph_red },
		CmpItemKindProperty = { fg = c.mikey_orange },
		CmpItemKindUnit = { fg = c.white },
		CmpItemKindConstant = { fg = c.mikey_orange },
		CmpItemKindString = { fg = c.donnie_purple },

		-- ============================================================================
		-- INDENT BLANKLINE
		-- ============================================================================

		IndentBlanklineChar = { fg = c.shadow },
		IndentBlanklineContextChar = { fg = c.sewer_gray },

		-- ============================================================================
		-- WHICH-KEY
		-- ============================================================================

		WhichKey = { fg = c.turtle_green, bold = true },
		WhichKeyGroup = { fg = c.leo_blue },
		WhichKeyDesc = { fg = c.fg },
		WhichKeySeparator = { fg = c.concrete },
		WhichKeyFloat = { bg = c.bg_alt },
		WhichKeyBorder = { fg = c.sewer_gray, bg = c.bg_alt },
	}

	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return M
