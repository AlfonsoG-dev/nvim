# My neovim config for windows 
- this is my first neovim setup base on videos and other repositories.
- I'm currently using this setup to work on coding wile learning about vim motions. 

---

# Dependencies 
>- [vim-plug](https://github.com/junegunn/vim-plug)
>- [powershell](https://www.microsoft.com/store/productid/9MZ1SNWT0N5D?ocid=pdpshare)
>- [chocolatey](https://chocolatey.org/install)
>- [git](https://git-scm.com/download/win)
>- [nodejs](https://nodejs.org/en)
>- [python](https://www.python.org/downloads/)
>- [java SE-17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
>- [go-language](https://go.dev)
>- [mysql](https://dev.mysql.com/downloads/mysql/)
>- [c-# dotnet](https://dotnet.microsoft.com/en-us/download)
>- [nerd-fonts](https://www.nerdfonts.com)
>- [MinGW](https://www.mingw-w64.org)

---

## Other dependencies for windows
>- neovim: `choco install neovim`
>- ripgrep: `choco install ripgrep`
>- fd: `choco install fd`
>- gnu-sed: `choco install sed`

---

# Installation 
>- clone the repository inside *"~/.config/"* folder.
>- a new folder is created called *"nvim"*.
>- enter the folder using: `cd .\nvim`
>- inside of "nvim" folder create another folder called: `mkdir plugged`
>- inside of "nvim" folder open with nvim the file `init.vim` or `nvim -p init.vim`
>- when inside of neovim use the command *": PlugInstall"* in order to install the plugins.
>- reload the editor and explore the config

---

# Configuration of coc completion for neovim
>- install coc packages for a variety of languages 
>- in the command line use the following list of languages to install for code completion:
```terminal
CocInstall coc-java coc-pyright coc-json coc-tsserver coc-html coc-markdown-preview-enhanced coc-webview coc-htmldjango coc-sql coc-git coc-css coc-vimlsp coc-powershell coc-sh coc-go coc-restclient coc-clangd
```

## Config vim-figitive for git workflow
>- [vim-fugitive](https://github.com/tpope/vim-fugitive)
## Config coc-powershell for terminal integration
>- download powershell: `winget search Microsoft.PowerShell` or from windows shop
>>- if powershell execution is on path use: `pwsh.exe`
>>- if powershell execution is not on windows path use: `C:\Users\miUser\AppData\Local\Microsoft\WindowsApps\Microsoft.PowerShell_8wekyb3d8bbwe\pwsh.exe`
>- or use the path to the executable.

## Change coc configuration 

>- Java: set up the java path environment variable.
>>- open coc configuration using: `nvim ~/AppData/Local/nvim/coc-settings.json`
>>- set up the java run time for code completion: `java.configuration.runtimes`
>>- Change the Java Path variable to: `C:/ProgramData/Java/jdk17` or use the path to the *jdk* installation.

>- Python: set up the python path environment variable.
>>- open coc configuration using: `nvim ~/AppData/Local/nvim/coc-settings.json`
>>- set up the python path variable for *htmldjango*: `htmldjango.builtin.pythonPath`
>>- change the python path to the environment variable: `C:/Python311/python.exe` or use the path to the python installation.

>- NodeJS: set up the node path environment variable.
>>- open coc configuration using: `nvim ~/AppData/Local/nvim/coc-settings.json`
>>- change the node path to the environment variable: `C:/Program Files/nodejs` or use the path to the node installation.

>- clangd: set up the clang lenguage server: use `CocCommand clangd.install`
>- on windows you need MinGW

---

# Discalimer
>- this is my own setup and may have some errors, which is totally fine.
>- this neovim setup is for educational purposes.
