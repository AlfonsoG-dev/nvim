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
keymap("n", "<A-k>", ":resize -2 <CR>", opts)
keymap("n", "<A-j>", ":resize +2 <CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2 <CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2 <CR>", opts)

--navigate
keymap("n", "<leader>te", ":tabedit <CR>", opts)
keymap("n", "<A-l>", ":tabnext <CR>", opts)
keymap("n", "<A-h>", ":tabprevious <CR>", opts)
keymap("n", "<A-.>", ":bnext <CR>", opts)
keymap("n", "<A-,>", ":bprevious <CR>", opts)
--mover la ventana de posición
keymap("n", "<space>m", ":tabmove", opts)
--navigate split buffer
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)

--move line
keymap("n", "<A-Down>", "<ESC>:m .+1<CR>", opts)
keymap("n", "<A-Up>", "<ESC>:m .-2<CR>", opts)

--move block line

keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)

--buscar y reemplazar
vim.keymap.set("n", "<leader>br",function()
    require("spectre").open_file_search({select_word=true})
end)

-- Save with Ctrl + S
nnoremap("<space>w", "<cmd>:w!<CR>")
nnoremap("<space>x", "<cmd>:x!<CR>")

-- Close buffer
nnoremap("<space>q", "<cmd>:q!<CR>")

-- Delete buffer
nnoremap("<A-w>", ":bd!<CR>")

--ver archivos modificados en buffer
nnoremap("<leader>gd", "<Cmd>Git diff<CR>")

-- indent in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Telescope
nnoremap("<leader>F", "<Cmd>Telescope find_files<CR>")
nnoremap("<leader>lg", "<Cmd>Telescope live_grep<CR>")
nnoremap("<leader>h", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
nnoremap("<leader>fb", "<Cmd>Telescope buffers<CR>")
nnoremap("<leader>c", "<Cmd>Telescope commands<CR>")
nnoremap("<leader>gs", "<Cmd>Telescope git_status<CR>")
nnoremap("<leader>gc", "<Cmd>Telescope conventional_commits<CR>")
nnoremap("<leader>k", "<Cmd>Telescope keymaps<CR>")

--mostrar log de git
nnoremap("<space>ga", "<cmd>:Git add %<CR>", opts)
nnoremap("<space>gc", "<Cmd>:Git commit<CR>")
nnoremap("<space>gp", "<Cmd>:Git push<CR>")

-- File explorer
nnoremap("<C-a>", "<Cmd>:NERDTreeToggleVCS<CR>")  -- NvimTree
