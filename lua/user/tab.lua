-- Active tab styling
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#f9e2af", bg = "#3b4261", bold = true })

-- Inactive tab styling
vim.api.nvim_set_hl(0, "TabLine", { fg = "#cba6f7", bg = "#1f2335" })

-- Empty background space to the right of the tabs
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#16161e" })
