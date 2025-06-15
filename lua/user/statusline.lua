-- Función global para diagnósticos
_G.status_diagnostic = function()
  local info = vim.b.coc_diagnostic_info or {}
  if vim.tbl_isempty(info) then return '' end

  local msgs = {}
  if info.error and info.error > 0 then table.insert(msgs, ' ' .. info.error) end
  if info.warning and info.warning > 0 then table.insert(msgs, ' ' .. info.warning) end
  if info.information and info.information > 0 then table.insert(msgs, ' ' .. info.information) end
  if info.hint and info.hint > 0 then table.insert(msgs, ' ' .. info.hint) end

  return table.concat(msgs, ' ') .. ' ' .. (vim.g.coc_status or '')
end


-- Statusline en Lua (ordenado y limpio)
vim.o.statusline = table.concat({
  ' ',                                            -- Icono decorativo
  '%f',                                             -- Nombre del archivo con ruta relativa
  ' [%{WebDevIconsGetFileTypeSymbol()}]',          -- Icono del tipo de archivo
  '%m',                                             -- Indica si el buffer fue modificado [+]
  ' %= ',                                           -- Separador central
  '%{v:lua.status_diagnostic()}',                  -- Diagnóstico Coc
  ' %<',                                            -- Recorte si se excede el ancho
  '%{get(g:,"coc_git_status","")}',                -- Git (global)
  '%{get(b:,"coc_git_status","")}',                -- Git (buffer)
  '%{get(b:,"coc_git_blame","")}',                 -- Git blame
  ' %y',                                            -- Tipo de archivo
  ' | %l:%c '                                       -- Línea y columna
})
