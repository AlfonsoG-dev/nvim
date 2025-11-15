-- =========================
--  SHOW DOCS
-- =========================
function _G.show_docs()
  local word = vim.fn.expand("<cword>")
  local ft = vim.bo.filetype

  -- Si CoC está listo y tiene proveedor para hover → usar hover
  if vim.api.nvim_eval('coc#rpc#ready()') == 1
     and vim.fn.CocHasProvider("hover") == 1 then
    vim.fn.CocActionAsync("doHover")
    return
  end

  -- Si NO hay soporte → buscar en Google con tipo de archivo
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

-- Función para TAB (necesaria para coc#pum)
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col <= 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end


-- =========================
--  KEYMAPS (UNIVERSALES)
-- =========================
local insert_opts = { silent = true, noremap = true, expr = true }
local normal_opts = { silent = true, nowait = true }

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local keyset = vim.keymap.set

    -- ===== AUTOCOMPLETE =====
    keyset("i", "<TAB>",
      'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
      insert_opts
    )

    keyset("i", "<S-TAB>",
      'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"',
      insert_opts
    )

    keyset("i", "<CR>",
      'coc#pum#visible() ? coc#pum#confirm() : "<CR>"',
      { silent = true, noremap = true, expr = true }
    )

    keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
    keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

    -- ===== LSP-LIKE NAVIGATION =====
    keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", normal_opts)
    keyset("n", "]g", "<Plug>(coc-diagnostic-next)", normal_opts)
    keyset("n", "gd", "<Plug>(coc-definition)", normal_opts)
    keyset("n", "gy", "<Plug>(coc-type-definition)", normal_opts)
    keyset("n", "gi", "<Plug>(coc-implementation)", normal_opts)
    keyset("n", "gr", "<Plug>(coc-references)", normal_opts)

    -- ==== HOVER ====
    keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", normal_opts)

    -- ==== CODE ACTIONS / RENAME ====
    keyset("n", "<leader>rn", "<Plug>(coc-rename)", normal_opts)
    keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", normal_opts)
    keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)")
    keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", normal_opts)

    -- ==== FORMAT =====
    keyset("x", "<leader>f", "<Plug>(coc-format-selected)")
    keyset("n", "<leader>f", "<Plug>(coc-format-selected)", normal_opts)

    -- ==== REFACTOR ====
    keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", normal_opts)
    keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)")
    keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", normal_opts)

    -- ==== SCROLL EN FLOATING WINDOWS ====
    local float_opts = { silent = true, nowait = true, expr = true }
    keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', float_opts)
    keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', float_opts)
    keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', float_opts)
    keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', float_opts)
  end
})
