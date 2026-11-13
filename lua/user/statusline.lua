-- Highlight groups
vim.api.nvim_set_hl(0, "SLGitBranch", { fg = "#89b4fa", bold = true })
vim.api.nvim_set_hl(0, "SLGitChanges", { fg = "#f38ba8" })
vim.api.nvim_set_hl(0, "SLFile", { fg = "#f9e2af", bold = true })
vim.api.nvim_set_hl(0, "SLIcon", { fg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "SLPosition", { fg = "#cba6f7" })

vim.o.statusline = table.concat({
    -- Left section: File information
    "%#SLIcon#   ",
    "%#SLFile#%t",
    " [%{WebDevIconsGetFileTypeSymbol()}]",
    "%m",

    "%=",

    -- Right section: Git information
    "%#SLGitBranch#",
    '%{FugitiveHead() != "" ? " " . FugitiveHead() : ""}',

    "%#SLGitChanges#",
    "%{FugitiveStatusline()}",

    -- File information
    "%#SLFile#",
    " | %y",

    -- Cursor position
    "%#SLPosition#",
    " | %l:%c ",
})
