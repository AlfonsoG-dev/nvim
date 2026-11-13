local status, nvim_lsp = pcall(require('lspconfig'))

if (not status) then return end

nvim_lsp.tsserver.setup({
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
})
