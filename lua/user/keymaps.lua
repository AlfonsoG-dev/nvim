-- General key maps

local Utils = require("user.utils")
local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local nmap = Utils.nmap

-- cancel hlsearch with ESC
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", opts)

-- markdown 
nmap('<leader>rm', '<Plug>MarkdownPreviewToggle')

--resise window
keymap("n", "<C-A-Down>", ":resize +2 <CR>", opts)
keymap("n", "<C-A-Up>", ":resize -2 <CR>", opts)
keymap("n", "<C-A-Right>", ":vertical resize -2 <CR>", opts)
keymap("n", "<C-A-Left>", ":vertical resize +2 <CR>", opts)

--navigate
keymap("n", "<leader>tn", ":tabnew <CR>", opts)
keymap("n", "<A-l>", ":tabnext <CR>", opts)
keymap("n", "<A-h>", ":tabprevious <CR>", opts)
keymap("n", "<A-.>", ":bnext <CR>", opts)
keymap("n", "<A-,>", ":bprevious <CR>", opts)

--mover la ventana de posición
keymap("n", "<leader>t-", "<ESC>:-tabmove<CR>", opts)
keymap("n", "<leader>t+", "<ESC>:+tabmove<CR>", opts)

--navigate split buffer
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)

--navigate to file and line Number
keymap("n", "<A-f>", "<C-w>F", opts)

-- move line
keymap("n", "<A-j>", "<ESC>:move .+1<CR>", opts)
keymap("n", "<A-k>", "<ESC>:move .-2<CR>", opts)

--move block line
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- move by lines in wrap text
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})

-- Increment/reduce
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- Save with Ctrl + S
nnoremap("<space>w", "<cmd>:w!<CR>")
nnoremap("<space>x", "<cmd>:x!<CR>")

-- Close buffer
nnoremap("<space>q", "<cmd>:q!<CR>")

-- Delete buffer
nnoremap("<A-w>", ":bdelete!<CR>")

-- indent in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Telescope key maps
nnoremap("<leader>F", "<Cmd>Telescope find_files<CR>")
nnoremap("<leader>lg", "<Cmd>Telescope live_grep<CR>")
nnoremap("<leader>h", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
nnoremap("<leader>fb", "<Cmd>Telescope buffers<CR>")
nnoremap("<leader>c", "<Cmd>Telescope coc<CR>")
nnoremap("<leader>gs", "<Cmd>Telescope git_status<CR>")
nnoremap("<leader>gc", "<Cmd>Telescope conventional_commits<CR>")
nnoremap("<leader>k", "<Cmd>Telescope keymaps<CR>")
nnoremap("<leader>m", "<Cmd>Telescope marks<CR>")

-- search the current word under cursor
keymap('n', '<leader>ll', function()
  local word = vim.fn.expand("<cword>")
  if word == "" then return end

  -- Escapar caracteres especiales de Vim regex
  word = vim.fn.escape(word, '\\/.*$^~[]')

  local ext = vim.fn.expand("%:e")

  -- Si no hay extensión, buscar en todos los archivos
  local pattern = ext ~= "" and ('**/*.' .. ext) or '**/*'

  -- Buscar palabra exacta (case sensitive): \C\<word\>
  vim.cmd('vimgrep /\\C\\<' .. word .. '\\>/gj ' .. pattern)

  -- Abrir resultados
  vim.cmd('copen')
end, {
  noremap = true,
  silent = true,
  desc = "Buscar palabra exacta (case-sensitive) en archivos del mismo tipo"
})
-- git keymaps
nnoremap("<space>ga", "<cmd>:Git add %<CR>")
nnoremap("<space>gp", "<Cmd>:Git push<CR>")
nnoremap("<space>gd", "<Cmd>:Git diff<CR>")
nnoremap("<space>gc", "<Cmd>:Git commit<CR>")
-- navigate between file changes
keymap("n", "<space>j", "<Cmd>:Gitsigns prev_hunk<CR>")
keymap("n", "<space>k", "<Cmd>:Gitsigns next_hunk<CR>")

-- File explorer
nnoremap("<C-a>", "<Cmd>:NERDTreeToggle<CR>")  -- NvimTree

function _G.search_word()
    local word = vim.fn.expand("<cword>")
    local ft = vim.bo.filetype
  -- Si NO hay lenguaje instalado → Buscar en Google
  local query = string.format(
    "https://www.google.com/search?q=%s+%s",
    ft,
    word
  )

  if vim.fn.has("win32") == 1 then
    os.execute('start "" "' .. query .. '"')
  else
    os.execute('xdg-open "' .. query .. '"')
  end
end
keymap("n", "<leader>gg", "<CMD>lua _G.search_word()<CR>", opts)
-- native suggestion
vim.keymap.set("i", "<Tab>", function()
  -- Obtener la columna del cursor (0-index)
  local col = vim.fn.col(".") - 1
  
  -- Si estamos al inicio o el carácter anterior es un espacio en blanco
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return "<Tab>"   -- Inserta tab normal
  else
    return "<C-n>"   -- Abre completado nativo
  end
end, { expr = true, noremap = true })

