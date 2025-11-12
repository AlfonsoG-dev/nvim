if vim.loader then
    vim.loader.enable()
end
-- Visual
vim.opt.showmode           = false
vim.opt.title              = true
vim.opt.termguicolors      = true                         -- Use true colors, required for some plugins
vim.opt.number             = true
vim.opt.relativenumber     = true
vim.opt.signcolumn         = 'yes'
vim.opt.cursorline         = true
vim.opt.cursorcolumn       = true

-- Behavior
vim.opt.hlsearch           = true
vim.opt.ignorecase         = true                         -- Ignore case when using lowercase in search
vim.opt.smartcase          = true                         -- But don't ignore it when using upper case
vim.opt.smarttab           = true
vim.opt.smartindent        = true
vim.opt.expandtab          = true                         -- Convert tabs to spaces.
vim.opt.tabstop            = 4
vim.opt.shiftwidth         = 4
vim.opt.softtabstop        = 4
vim.opt.splitbelow         = true
vim.opt.splitright         = true
vim.opt.scrolloff          = 12                           -- Minimum offset in lines to screen borders
vim.opt.sidescrolloff      = 8
vim.opt.shortmess:append("SI")
vim.opt.iskeyword:remove("_")

-- Vim specific
vim.opt.hidden             = true                         -- Do not save when switching buffers
vim.opt.fileencoding       = "utf-8"
vim.opt.completeopt        = "menuone,noinsert,noselect"
vim.opt.updatetime         = 500                          -- Delay until write to Swap and HoldCommand event
vim.opt.timeoutlen         = 500
vim.opt.list               = true
vim.opt.listchars = {
  tab = '→ ',
  trail = '·',
  extends = '>',
  precedes = '<',
  nbsp = '+'
}
vim.opt.fillchars = {
  fold = ' ',
  vert = '|',
  eob = ' ',
  msgsep = '-'
}
