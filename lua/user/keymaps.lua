-- General keymaps that are not pluggin dependant
-- the file "lua/lsp/utils.lua" contains lsp-specific commands.

local Utils = require("user.utils")
local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap
local op = {buffer = 0}

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap

--reize window
keymap("n", "<C-k>", ":resize -2 <CR>", opts)
keymap("n", "<C-j>", ":resize +2 <CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2 <CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2 <CR>", opts)

--navigate
keymap("n", "<A-,>", ":BufferLineCyclePrev <CR>", opts)
keymap("n", "<A-.>", ":BufferLineCycleNext <CR>", opts)
keymap("n", "<A-l>", ":BufferLineMoveNext <CR>", opts)
keymap("n", "<A-h>", ":BufferLineMovePrev <CR>", opts)

--move line
keymap("n", "<A-Down>", "<ESC>:m .+1<CR>", opts)
keymap("n", "<A-Up>", "<ESC>:m .-2<CR>", opts)

--move block line

keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)

-- Save with Ctrl + S
nnoremap("<space>w", "<cmd>:w!<CR>")
nnoremap("<space>x", "<cmd>:x!<CR>")

-- Close buffer
nnoremap("<space>q", "<cmd>:q!<CR>")

-- Delete buffer
nnoremap("<A-w>", ":bd!<CR>")

--ver archivos modificados en buffer
nnoremap("<leader>gd", "<Cmd>Git diff<CR>")

-- Telescope
nnoremap("<leader>F", "<Cmd>Telescope find_files<CR>")
nnoremap("<leader>h", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
nnoremap("<leader>b", "<Cmd>Telescope buffers<CR>")
nnoremap("<leader>c", "<Cmd>Telescope commands<CR>")
nnoremap("<leader>gs", "<Cmd>Telescope git_status<CR>")
nnoremap("<leader>gc", "<Cmd>Telescope git_commits<CR>")
nnoremap("<leader>k", "<Cmd>Telescope keymaps<CR>")
nnoremap("<leader>fb", "<Cmd>Telescope buffers<CR>")
nnoremap("<leader>s", "<Cmd>Telescope treesitter<CR>")

--mostrar log de git
nnoremap("<space>g", "<Cmd>:CocCommand git.showBlameDoc<CR>")

-- File explorer
nnoremap("<C-a>", "<Cmd>:NERDTreeToggleVCS<CR>")  -- NvimTree
