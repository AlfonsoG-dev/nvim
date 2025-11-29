vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "kanagawa-dragon",
  callback = function()
    -- Color de columna límite (ColorColumn)
    vim.api.nvim_set_hl(0, "ColorColumn", {
      bg = "#424d5e",
    })

    -- Línea del cursor sin cambiar color del texto
    vim.api.nvim_set_hl(0, "CursorLine", {
      bg = "#424d5e",
      bold = true,  -- opcional
    })

    -- Columna del cursor
    vim.api.nvim_set_hl(0, "CursorColumn", {
      fg = "#ffffff",
      bg = "#37475e",
      bold = true,
    })
  end
})
require('kanagawa').setup({
    commentStyle = {italic = true, bold = true},
    keywordStyle = {bold = true},
    dimInactive = false,
    overrides = function(colors)
        local theme = colors.theme
        return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend},
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
        }
    end,
})
