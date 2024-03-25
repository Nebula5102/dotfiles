-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = " "} -- remove ~ at end of file

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Indentation
vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false


-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Remove auto commenting
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
