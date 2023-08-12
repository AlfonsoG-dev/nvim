# Configuración local de nvim para windows
>>- mi configuración inicial de nvim hecha a vace de tutoriales y otros repositorios
>>- es una configuración con la que aprendi a configurar nvim por lo tanto no esta muy ordenada

---

## Dependencias 
>>- [vim-plug](https://github.com/junegunn/vim-plug)
>>- [chocolatey](https://chocolatey.org/install)
>>- [git](https://git-scm.com/download/win)
>>- [nodejs para coc-nvim](https://nodejs.org/es)
>>- [python 3.11](https://www.python.org/downloads/release/python-3110/)
>>- [java SE-17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
>>- [c-# dotnet](https://dotnet.microsoft.com/en-us/download)
>>- [omnisharp for coc-completion](https://github.com/coc-extensions/coc-omnisharp)


---
## Instalacion chocolatey packages
>>- neovim: ``coho install neovim``
>>- ripgrep: ``coho install ripgrep``
>>- fd: ``coho install fd``

---
## Instalación 
>>- clona el repositorio 
>>- entra en la carpeta nvim que crea la clonación con : ``cd ./nvim``
>>- crea una carpeta "plugged" dentro de la carpeta "nvim": ``mkdir plugged``
>>- abre el archvo `init.vim`: ``nvim -p init.vim``
>>- cambia la ruta de los plugins a tu ruta: ``call plug#begin('ruta de los plugins')``
>>>- EJM_linux_ubuntu: `call plug#begin('~/.config/nvim/plugged')`
>>>- EJM_windows: `call plug#begin(./AppData/Local/nvim/plugged)`
>>- instala los plugins con ==vim-plug==: 
>>>- entra a la linea de comandos de nvim con `semicolumn - ':'`
>>>- instala los plugins: `:PlugInstall`
>>- cierra y abre el documento para ver los cambios 

---

## Config coc for completion
>>- instalar packages for completion
`CocInstall coc-java coc-pyright coc-json coc-tsserver coc-html coc-markdown coc-htmldjango coc-emmet coc-eslint coc-lua coc-sql coc-git coc-css`

>>- `coc-metals`: esta extensión de metals para coc esta obsoleta, ==muy pronto la reemplazare==

## Config vim-figitive for git workflow
>>-[vim-fugitive](https://github.com/tpope/vim-fugitive)
