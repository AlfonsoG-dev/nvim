vim.api.nvim_set_hl(0, "SLGitBranch", { fg = "#89b4fa", bold = true })     -- Azul claro
vim.api.nvim_set_hl(0, "SLGitChanges", { fg = "#f38ba8" })                -- Rojo suave
vim.api.nvim_set_hl(0, "SLFile",       { fg = "#f9e2af" })                -- Verde
vim.api.nvim_set_hl(0, "SLIcon",       { fg = "#a6e3a1" })                -- Amarillo
vim.api.nvim_set_hl(0, "SLPosition",   { fg = "#cba6f7" })                -- Morado

vim.o.statusline = table.concat({
  '%#SLIcon#', ' ',                        -- Icono decorativo con color
  '%#SLFile#', '%t',                        -- Nombre del archivo
  ' [%{WebDevIconsGetFileTypeSymbol()}]',   -- Icono del tipo de archivo
  '%m',                                     -- Modificado [+]
  ' %= ',                                   -- Separador central
  ' %<',                                    -- Truncamiento

  -- --- Git info (rama + cambios) ---
  '%#SLGitBranch#',
  ' %{len(FugitiveHead()) ? " " . FugitiveHead() : ""}',

  '%#SLGitChanges#',
  ' %{FugitiveStatusline()}',

  -- --- Info del archivo ---
  '%#SLFile#',
  ' | %y',

  -- --- Posición ---
  '%#SLPosition#',
  ' | %l:%c ',
})
