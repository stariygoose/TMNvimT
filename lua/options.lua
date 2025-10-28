local opt = vim.opt
local o = vim.o
local g = vim.g

-- Persistent Undo
opt.undofile = true
opt.undolevels = 10000
opt.undoreload = 10000
local undodir = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p") -- Creates Undo dir if not exist
end
vim.opt.undodir = undodir

-- Shared clipboard
o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Show line index
opt.number = true

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- Disable ~ sign for blank lines
vim.opt.fillchars = { eob = " " }

vim.opt.termguicolors = true
