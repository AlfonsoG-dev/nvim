
-- Colores del menú de coc.nvim
vim.api.nvim_set_hl(0, "CocMenuSel", { bg = "#3c3836", fg = "#ebdbb2" })
vim.api.nvim_set_hl(0, "CocPumVirtualText", { bg = "#282828", fg = "#928374" })

-- Delimitadores de cursor (línea y columna)
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#424d5e" })
-- Evitar cambiar el color del texto en la línea del cursor
vim.api.nvim_set_hl(0, "CursorLine", {
    bg = "#424d5e", -- solo fondo
    bold = true     -- opcional: negrita
})
vim.api.nvim_set_hl(0, "CursorColumn", {
  fg = "White", bg = "#37475e", bold = true
})
