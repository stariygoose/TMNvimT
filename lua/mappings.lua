local map = vim.keymap.set

-- Leader key
map("i", "jk", "<ESC>")

-- Select all
map("n", "<C-a>", "ggVG")

-- Copy/Paste
map("i", "<C-v>", "p", { desc = "Insert from buffer" })

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Basic Actions
map({ "n", "v" }, ";", ":", { desc = "Cmd enter command mode" })
map("x", "p", '"_dP', { desc = "Paste without overwriting register" })

map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<Cmd>confirm q<CR>", { desc = "Window quit" })
map("n", "<leader>Q", "<Cmd>confirm qall<CR>", { desc = "General quit NeoVim" })

-- Change windows
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Clear highlights
map("n", "<C-`>", "<cmd>noh<CR>", { desc = "Clear highlights" })

-- File Explorer
map("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

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
local builtin = require("telescope.builtin")

-- Find Files
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fa", function()
	builtin.find_files({ hidden = true, no_ignore = true })
end, { desc = "Find all files (hidden)" })
map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })

-- Find Words
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Find word under cursor" })
map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Search in current buffer" })
-- Theming
map("n", "<leader>hh", "<Cmd>Telescope highlights<CR>", { desc = "Show highlights" })
-- </Telescop>

-- Comments
map("n", "<C-e>", "gcc", { desc = "Toggle Comment", remap = true })
map("x", "<C-e>", "gc", { desc = "Toggle Comment", remap = true })

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
map({ "n", "v" }, "<A-e>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map({ "n", "v" }, "<A-q>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map({ "n", "v" }, "<A-w>", "<Cmd>bd<CR>", { desc = "Close buffer" })
-- Go to n buffer
for i = 1, 9 do
	map("n", ("<A-%d>"):format(i), (":BufferLineGoToBuffer %d<CR>"):format(i), { desc = "Go to buffer " .. i })
end
-- </Buffers>

-- <Git>
-- Diff View
map("n", "<leader>gdo", "<cmd>DiffviewOpen<CR>", { desc = "Diffview Open" })
map("n", "<leader>gdc", "<cmd>DiffviewClose<CR>", { desc = "Diffview Close" })
map("n", "<leader>gdh", "<cmd>DiffviewFileHistory<CR>", { desc = "Diffview History" })
map("n", "<leader>gdf", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview File History" })
map("n", "<leader>gdr", "<cmd>DiffviewRefresh<CR>", { desc = "Diffview Refresh" })
-- Git Conflict
map("n", "<leader>gco", "<cmd>GitConflictChooseOurs<CR>", { desc = "Choose Ours" })
map("n", "<leader>gct", "<cmd>GitConflictChooseTheirs<CR>", { desc = "Choose Theirs" })
map("n", "<leader>gcb", "<cmd>GitConflictChooseBoth<CR>", { desc = "Choose Both" })
map("n", "<leader>gc0", "<cmd>GitConflictChooseNone<CR>", { desc = "Choose None" })
map("n", "<leader>gcn", "<cmd>GitConflictNextConflict<CR>", { desc = "Next Conflict" })
map("n", "<leader>gcp", "<cmd>GitConflictPrevConflict<CR>", { desc = "Prev Conflict" })
map("n", "<leader>gcl", "<cmd>GitConflictListQf<CR>", { desc = "List Conflicts" })
-- </Git>
