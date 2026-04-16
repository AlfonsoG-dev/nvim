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
local lspkind = require('lspkind')
lspkind.init({
    mode = 'symbol_text',
    preset = 'codicons',
    symbol_map = {
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
    },
})

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
        fields = { 'abbr', 'icon', 'kind', 'menu' },
        format = lspkind.cmp_format({
            maxwidth = {
                menu = 50, -- leading text (labelDetails)
                abbr = 50, -- actual suggestion item
            },
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            before = function (entry, vim_item)
                -- ...
                return vim_item
            end
        })
    }
})
-- for react

local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
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
