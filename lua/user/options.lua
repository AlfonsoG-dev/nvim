if vim.loader then
    vim.loader.enable()
end
-- Visual
vim.o.showmode           = false
vim.o.title              = true
vim.o.termguicolors      = true                         -- Use true colors, required for some plugins
vim.wo.number            = true
vim.wo.relativenumber    = true
vim.wo.signcolumn        = 'yes'
vim.wo.cursorline        = true
vim.wo.cursorcolumn = true

-- Behavior
vim.o.hlsearch           = false
vim.o.ignorecase         = true                         -- Ignore case when using lowercase in search
vim.o.smartcase          = true                         -- But don't ignore it when using upper case
vim.o.smarttab           = true
vim.o.smartindent        = true
vim.o.expandtab          = true                         -- Convert tabs to spaces.
vim.o.tabstop            = 4
vim.o.shiftwidth         = 4
vim.o.softtabstop        = 2
vim.o.splitbelow         = true
vim.o.splitright         = true
vim.o.scrolloff          = 12                           -- Minimum offset in lines to screen borders
vim.o.sidescrolloff      = 8

-- Vim specific
vim.o.hidden             = true                         -- Do not save when switching buffers
vim.o.fileencoding       = "utf-8"
vim.o.completeopt        = "menuone,noinsert,noselect"
vim.o.wildmode           = "longest,full"               -- Display auto-complete in Command Mode
vim.o.updatetime         = 500                          -- Delay until write to Swap and HoldCommand event
vim.o.timeoutlen         = 500
vim.g.do_file_type_lua   = 1
