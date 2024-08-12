vim.cmd[[
    "mostrar los cambios o el log de git
    "configuracion de status bar
    set statusline+=
    set statusline+=<<~
    set statusline+=%{expand('%:~:.')}\ [%{WebDevIconsGetFileTypeSymbol()}]
    set statusline+=~>>
    set statusline +=%=

    " Add (Neo)Vim's native statusline support
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline
    function! StatusDiagnostic() abort
        let info = get(b:, 'coc_diagnostic_info', {})
        if empty(info) | return '' | endif
        let msgs = []
        if get(info, 'error', 0)
            call add(msgs, ' ' . info['error'])
        endif
        if get(info, 'information', 0)
            call add(msgs, ' ' . info['information'])
        endif
        if get(info, 'hint', 0)
            call add(msgs, ' ' . info['hint'])
        endif
        return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
    endfunction

    set statusline +=\^
    set statusline +=%{StatusDiagnostic()}
    set statusline +=/^
    set statusline ^=
    set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
]]
