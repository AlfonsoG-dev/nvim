# Configuración local de nvim para windows
>>- Mi configuración inicial de nvim hecha a base de tutoriales y otros repositorios
>>- Es mi primera configuración para nvim

---

## Dependencias 
>>- [vim-plug](https://github.com/junegunn/vim-plug)
>>- [powershell](https://www.microsoft.com/store/productid/9MZ1SNWT0N5D?ocid=pdpshare)
>>- [chocolatey](https://chocolatey.org/install)
>>- [git](https://git-scm.com/download/win)
>>- [nodejs para coc-nvim](https://nodejs.org/es)
>>- [python 3.11](https://www.python.org/downloads/release/python-3110/)
>>- [java SE-17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
>>- [scala](https://www.scala-lang.org/download/3.3.0.html)
>>- [mysql](https://dev.mysql.com/downloads/mysql/)
>>- [c-# dotnet](https://dotnet.microsoft.com/en-us/download)
>>- [omnisharp for coc-completion](https://github.com/coc-extensions/coc-omnisharp)
>>- [sbt](https://www.scala-sbt.org/download.html)
>>- [nerd-fonts](https://www.nerdfonts.com)


---

## Instalacion chocolatey packages
>>- neovim: ``choco install neovim``
>>- ripgrep: ``choco install ripgrep``
>>- fd: ``choco install fd``
>>- gnu-sed: `choco install sed`

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
>>- entra en la linea de comandos de nvim y escribe:
`:CocInstall  coc-java coc-pyright coc-json coc-tsserver coc-html coc-markdown-preview-enhanced coc-webview coc-htmldjango coc-lua coc-sql coc-git coc-css coc-vimlsp coc-powershell coc-sh coc-go`

### Config vim-figitive for git workflow
>>- [vim-fugitive](https://github.com/tpope/vim-fugitive)
### Config coc-powershell for terminal integration
>- download powershell: `winget search Microsoft.PowerShell` or from windows shop
>>- if powershell execution is in windows path: `pwsh.exe`
>>- if not powershell execution is not in windows path: `C:\Users\miUser\AppData\Local\Microsoft\WindowsApps\Microsoft.PowerShell_8wekyb3d8bbwe\pwsh.exe`

### Change coc config 

>>- Java: cambia la ruta en la que se encuentra instalado Java
>>>- coc-config: `nvim coc-settings.json` 
>>>- Java_runtime: `java.configuration.runtimes`
>>>- Change Java Path: `C:/ProgramData/Java/jdk17` -> ruta donde se instalo java

>>- Python: cambia la ruta en la que se encuentra instalado python para htmldjango
>>>- coc-config: `nvim coc-settings.json` 
>>>- htmldjango: `htmldjango.builtin.pythonPath`
>>>- change python path: `C:/Python311/python.exe` -> ruta donde se instalo python

>>- NodeJS: cambia la ruta en la que encuentra instalado NodeJS
>>>- coc-config: `nvim coc-settings.json` 
>>>- eslint: `eslint.nodoPath` 
>>>- change node path: `C:/Program Files/nodejs` -> ruta donde se instalo NodeJS
---

# Sugerencias 
>- esta es una configuración amater de nvim por lo tanto puedes encontrar variedad de errores
>- no planeo modificar ni arreglar ciertos errores por el momento
>- la configuración actual fue hecha para aprender sobre la personalización de nvim
