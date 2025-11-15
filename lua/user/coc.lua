local ft = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "html",
  "css",
  "json",
  "sql",
  "python"
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = ft,
  callback = function()
    local keyset = vim.keymap.set

    -- Auto complete
    keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', {silent = true, noremap = true, expr = true, replace_keycodes = false})
    keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], {silent = true, noremap = true, expr = true})

    keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {silent = true, noremap = true, expr = true})

    keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
    keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

    -- Diagnostics
    keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
    keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

    -- GoTo
    keyset("n", "gd", "<Plug>(coc-definition)")
    keyset("n", "gy", "<Plug>(coc-type-definition)")
    keyset("n", "gi", "<Plug>(coc-implementation)")
    keyset("n", "gr", "<Plug>(coc-references)")

    -- Documentation
    keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

    -- Rename
    keyset("n", "<leader>rn", "<Plug>(coc-rename)")

    -- Formatting
    keyset("x", "<leader>f", "<Plug>(coc-format-selected)")
    keyset("n", "<leader>f", "<Plug>(coc-format-selected)")

    -- Code actions
    keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)")
    keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)")
    keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)")
    keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)")
    keyset("n", "<leader>qf", "<Plug>(coc-fix-current)")

    keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)")
    keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)")
    keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)")

    keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)")

    -- Floating window scrolling
    local opts = {silent = true, nowait = true, expr = true}
    keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
    keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

    keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
    keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)

    keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
    keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

    -- Selection range
    keyset("n", "<C-s>", "<Plug>(coc-range-select)")
    keyset("x", "<C-s>", "<Plug>(coc-range-select)")
  end,
})
