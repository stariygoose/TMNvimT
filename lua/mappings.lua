local map = vim.keymap.set

-- Leader key
map("i", "jk", "<ESC>")

-- Select all
map("n", "<C-a>", "ggVG")

-- Basic Actions
map({ "n", "v" }, ";", ":", { desc = "Cmd enter command mode" })
map('x', 'p', '"_dP', { desc = 'Paste without overwriting register' })

map("n", "<leader>w", "<Cmd>w<CR>", {desc = "Save"})
map("n", "<leader>q", "<Cmd>confirm q<CR>", {desc = "Window quit"})
map("n", "<C-q>", "<Cmd>confirm qall<CR>", {desc = "General quit NeoVim"})

-- Change windows
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Clear highlights
map("n", "<C-`>", "<cmd>noh<CR>", { desc = "Clear highlights" })

-- File Explorer
map("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", {desc = "Toggle File Explorer"})

-- Smooth scroll
local keymap = {
  ["K"] = function()
    require("neoscroll").scroll(-0.12, { move_cursor = false, duration = 100 })
  end,
  ["J"] = function()
    require("neoscroll").scroll(0.12, { move_cursor = false, duration = 100 })
  end,
}
for key, func in pairs(keymap) do
  map({ "n", "v", "x" }, key, func)
end

-- <Telescope>
local builtin = require('telescope.builtin')

-- Find Files
map("n", '<leader>ff', builtin.find_files, { desc = 'Find files' })
map('n', '<leader>fa', function()
  builtin.find_files({ hidden = true, no_ignore = true })
end, { desc = 'Find all files (hidden)' })
map('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })

-- Find Words
map('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
map('n', '<leader>fw', builtin.grep_string, { desc = 'Find word under cursor' })
map('n', '<leader>fz', builtin.current_buffer_fuzzy_find, { desc = 'Search in current buffer' })
-- Theming
map('n', '<leader>hh', '<Cmd>Telescope highlights<CR>', { desc = "Show highlights" })
-- </Telescop>

-- Comments
map("n", "<C-e>", "gcc", {desc = "Toggle Comment", remap = true})
map("x", "<C-e>", "gc", {desc = "Toggle Comment", remap = true})

-- <LSP>
-- Navigation
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "<leader>cr", vim.lsp.buf.references, { desc = "Show References" })

-- Information
map("n", "F", vim.lsp.buf.hover, { desc = "Documentation under cursor" })
-- </LSP>

-- <Buffers>
-- Navigation
map({"n", "v"}, "<A-.>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
map({"n", "v"}, "<A-,>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })

-- Reorder buffers
map({"n", "v"}, '<A->>', '<Cmd>BufferMoveNext<CR>', { desc = 'Move buffer right' })
map({"n", "v"}, '<A-<>', '<Cmd>BufferMovePrevious<CR>', { desc = 'Move buffer left' })

-- Go to n buffer
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { desc = 'Goto buffer 1' })
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { desc = 'Goto buffer 2' })
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { desc = 'Goto buffer 3' })
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { desc = 'Goto buffer 4' })
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { desc = 'Goto buffer 5' })
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { desc = 'Goto buffer 6' })
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { desc = 'Goto buffer 7' })
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { desc = 'Goto buffer 8' })
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { desc = 'Goto buffer 9' })
map('n', '<A-0>', '<Cmd>BufferLast<CR>', { desc = 'Goto last buffer' })

-- Closing
map('n', '<A-w>', '<Cmd>BufferClose<CR>', { desc = 'Close buffer' })
map('n', '<leader>bc', '<Cmd>BufferClose<CR>', { desc = 'Close buffer' })
map('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = 'Close all except current' })

-- Pin / Unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', { desc = 'Pin/Unpin buffer' })
map('n', '<leader>bp', '<Cmd>BufferPin<CR>', { desc = 'Pin/Unpin buffer' })

-- Sorting
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { desc = 'Sort by buffer number' })
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', { desc = 'Sort by directory' })
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', { desc = 'Sort by language' })
map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { desc = 'Sort by window number' })
-- </Buffers>

