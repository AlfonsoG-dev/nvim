require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "ts_ls"
    },
    automatic_installation = true,
})

-----------------------------------------------------------------------
-- nvim-cmp (autocompletion)
-----------------------------------------------------------------------
local cmp = require("cmp")
local luasnip = require("luasnip")
local kind_icons = {
    Class         = "",
    Color         = "",
    Constructor   = "",
    Enum          = "󰠱",
    EnumMember    = "",
    Field         = "󰜢",
    File          = "󰈙",
    Folder        = "󰉋",
    Function      = "󰊕",
    Interface     = "",
    Keyword       = "󱜦",
    Constant      = "󱃘",
    Event         = "",
    Operator      = "",
    TypeParameter = "",
    Method        = "󰆧",
    Module        = "󰙅",
    Property      = "",
    Reference     = "󰈇",
    Snippet       = "",
    Struct        = "",
    Text          = "󱎸",
    Unit          = "󰑭",
    Value         = "󰎠",
    Variable      = "",

    -- fallback
    Default       = "󰳾",
}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
    },
  -------------------------------------------------------------------
    -- 🔥 HERE: Custom completion item icons
    -------------------------------------------------------------------
    formatting = {
        format = function(entry, item)
            item.kind = string.format("%s %s", kind_icons[item.kind] or kind_icons.Default, item.kind)
            return item
        end,
    },
})

-- Error navigation
vim.keymap.set("n", "<space>a", require("telescope.builtin").diagnostics, {
    desc = "Diagnostics to loclist",
})

-- edior navigation
vim.keymap.set("n", "<space>o", require("telescope.builtin").lsp_document_symbols, {
    desc = "Search file symbols",
})

vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, {
    desc = "Search implementation",
})
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {
    desc = "Search references",
})
