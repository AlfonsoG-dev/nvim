call plug#begin("~/AppData/local/nvim/plugged")
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tribela/vim-transparent'
Plug 'folke/zen-mode.nvim'
Plug 'rebelot/kanagawa.nvim'

Plug 'easymotion/vim-easymotion'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'preservim/nerdtree'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'olacin/telescope-cc.nvim'
Plug 'fannheyward/telescope-coc.nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-rhubarb.git'
call plug#end()
"change fillchars for folding, vertical split end of buffer, and message
"separator
set fillchars=fold:\ ,vert:\|,eob:\ ,msgsep:-
set path+=**,.,,
filetype plugin on 
set isfname-=:
set splitbelow splitright
set autoread
setlocal spell spelllang=en_us,es
"configurar scheme
scriptencoding utf-8
set background=dark
" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》
"vimlsp completion
let g:markdown_fenced_languages = [
        \ 'vim',
        \ 'help'
      \ ]
"buscar selección
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

"corta la linea en un carácter definido
set linebreak
set showbreak=↪
set wildmode=full
set fileformats=dos,unix
set confirm
set history=100
syntax on
set nobackup
set noswapfile
set nowritebackup
set clipboard+=unnamedplus
set mouse=nic
set mousemodel=popup
set mousescroll=ver:1,hor:6
set shortmess+=S
set shortmess+=I
set pumheight=10
set pumblend=10
set winblend=10
set spelllang=en_us,es
set spellsuggest+=4
set virtualedit=block
set formatoptions+=mM
set tildeop
set colorcolumn+=110
set synmaxcol=250
set nostartofline

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%1:%c:%m
endif

"set cursor color in various modes
set guicursor=n-v-c-sm:block,i-ci-v:ver25-CursorLine,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175
" diff options
set diffopt=
set diffopt+=vertical  " show diff in vertical position
set diffopt+=filler  " show filler for deleted lines
set diffopt+=closeoff  " turn off diff when one file window is closed
set diffopt+=context:3  " context for diff
set diffopt+=internal,indent-heuristic,algorithm:histogram
set diffopt+=linematch:60
" Ignore certain files and folders when globing
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/*,*/bin/*,*/obj/*,*/null/*,*/metals/*,*/.bsp/*,*/blop/*,*/node_modules/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico,*.class,*.log
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

"
colorscheme kanagawa-dragon

"react jsx highlight
let g:vim_jsx_pretty_colorful_config = 1

"configurar easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap ss <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap ss <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>ñ <Plug>(easymotion-k)


" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList --no-quit --normal diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbols of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList --auto-preview outline<cr>
" Find symbols of lenguage
nnoremap <silent><nowait> <space>s  :<C-u>CocList --interactive symbols<cr>
" re-open the seach gd gr gi location
nnoremap <silent><nowait> <space>l  :<C-u>CocList --no-quit --normal location<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>gs  :<C-u>CocList --no-quit --normal gchanges<CR>
"importe de configuracion basica
lua << EOF
require("user.coc")
require("user.statusline")
require("user.cursor")
require("user.options")
require("user.keymaps")
require("user.termn")
require("user.telescope")
EOF
