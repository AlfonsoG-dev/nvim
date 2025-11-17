-- Statusline en Lua (ordenado y limpio)
vim.o.statusline = table.concat({
  ' ',                                            -- Icono decorativo
  '%t',                                             -- Nombre del archivo con ruta relativa
  ' [%{WebDevIconsGetFileTypeSymbol()}]',          -- Icono del tipo de archivo
  '%m',                                             -- Indica si el buffer fue modificado [+]
  ' %= ',                                           -- Separador central
  ' %<',                                            -- Recorte si se excede el ancho
  ' %y',                                            -- Tipo de archivo
  ' | %l:%c '                                       -- Línea y columna
})
