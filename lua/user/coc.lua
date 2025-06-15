-- utils
local keymap = vim.keymap.set
-- Función auxiliar para verificar espacio atrás
function _G.CheckBackspace()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Mostrar documentación
function _G.ShowDocumentation()
    if vim.fn.CocAction('hasProvider', 'hover') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_feedkeys('K', 'in', false)
    end
end

-- Keymaps para completion
keymap("i", "<Tab>", [[coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()]], { expr = true, silent = true })
keymap("i", "<S-Tab>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { expr = true, silent = true })
keymap("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { expr = true, silent = true })
keymap("i", "<C-Space>", "coc#refresh()", { expr = true, silent = true })

-- Navegación de errores
keymap("n", "<space>j", "<Plug>(coc-diagnostic-prev)", { silent = true })
keymap("n", "<space>k", "<Plug>(coc-diagnostic-next)", { silent = true })

-- Goto
keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
keymap("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keymap("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keymap("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Documentación
keymap("n", "K", ":lua ShowDocumentation()<CR>", { silent = true })

-- Symbol highlight
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.fn.CocActionAsync('highlight')
    end
})

-- Rename y formato
keymap("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
keymap({"x", "n"}, "<leader>ff", "<Plug>(coc-format-selected)", { silent = true })

-- Code actions
keymap({"x", "n"}, "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true })
keymap("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", { silent = true })
keymap("n", "<leader>as", "<Plug>(coc-codeaction-source)", { silent = true })
keymap("n", "<leader>qf", "<Plug>(coc-fix-current)", { silent = true })

-- Refactor
keymap("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keymap({"x", "n"}, "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Codelens
keymap("n", "<leader>cl", "<Plug>(coc-codelens-action)", { silent = true })

-- Text objects
keymap({"x", "o"}, "if", "<Plug>(coc-funcobj-i)")
keymap({"x", "o"}, "af", "<Plug>(coc-funcobj-a)")
keymap({"x", "o"}, "ic", "<Plug>(coc-classobj-i)")
keymap({"x", "o"}, "ac", "<Plug>(coc-classobj-a)")

-- Float window scroll
keymap({"n", "i", "v"}, "<C-f>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], { expr = true, silent = true, nowait = true })
keymap({"n", "i", "v"}, "<C-b>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], { expr = true, silent = true, nowait = true })

-- Selection range
keymap({"n", "x"}, "<C-s>", "<Plug>(coc-range-select)", { silent = true })

-- Commands
vim.api.nvim_create_user_command("Format", function()
    vim.fn.CocActionAsync("format")
end, {})

vim.api.nvim_create_user_command("Fold", function(opts)
    vim.fn.CocAction("fold", opts.args)
end, { nargs = "?" })

vim.api.nvim_create_user_command("OR", function()
    vim.fn.CocActionAsync("runCommand", "editor.action.organizeImport")
end, {})

-- Autocommand para formatexpr
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "javascript", "json", "java", "sql", "html" },
    callback = function()
        vim.bo.formatexpr = "CocAction('formatSelected')"
    end
})

vim.api.nvim_create_autocmd("User", {
    pattern = "CocJumpPlaceholder",
    callback = function()
        vim.fn.CocActionAsync('showSignatureHelp')
    end
})

