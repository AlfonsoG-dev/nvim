# Neovim custom configuration. 
- This is my first **Neovim** setup base on videos and other sources.
- I'm currently using this setup to learn about vim motions and some programming projects in (Java, C#, Python, Web). 

---

# Dependencies 
- [vim-plug](https://github.com/junegunn/vim-plug)
- [power_shell](https://www.microsoft.com/store/productid/9MZ1SNWT0N5D?ocid=pdpshare)
- [chocolatey](https://chocolatey.org/install)
- [git](https://git-scm.com/download/win)
- [nerd-fonts](https://www.nerdfonts.com)

---

# Other dependencies for windows
- `neovim`: `choco install neovim`
- `ripgrep`: `choco install ripgrep`
- `fd`: `choco install fd`
- `gnu-sed`: `choco install sed`

---

# Installation 
1. Clone the repository inside **C:\Users\userName\AppData\Local\** directory.
2. A new directory is created called *nvim*.
3. Enter the folder using: `cd nvim`.
4. Inside of **nvim** directory create another directory called: `md plugged` or `mkdir plugged`.
5. Inside of **nvim** directory open with `nvim init.vim`.
6. Inside of `init.vim` file, use the command `:PlugInstall` in order to install the plugins.
7. Reload the editor and explore the configuration.

---

## Additional plugins.
> Config vim-figitive for git workflow
>- [vim-fugitive](https://github.com/tpope/vim-fugitive)

---

# Discalimer
- This is my own setup and may have some errors, which is totally fine.
- It is not intended to make it like an IDE. I just want to try some stuff before migrating to **neovim**.
