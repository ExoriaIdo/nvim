vim.g.mapleader = ' '

local opt = vim.opt

-- Configuraciones básicas
opt.number = true
opt.relativenumber = true
opt.clipboard = 'unnamedplus'
opt.wrap = false
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.termguicolors = true
opt.conceallevel = 2
opt.cursorline = true

-- tabs settings
opt.expandtab = true        -- Convertir tabs en espacios
opt.smartindent = true

-- Asegurarse de que `listchars` y `fillchars` estén configurados
opt.listchars:append("space:⋅")
opt.fillchars:append("vert:│")

-- Configuración de pliegues (folding)
opt.foldmethod = 'indent'
opt.foldlevel = 99
opt.foldenable = true

opt.list = true
opt.listchars = "leadmultispace:⋅,trail:·"

-- Configurar mapeo para Terminal
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>x', ':w<CR>:!venv/bin/python3 %<CR>', { noremap = true, silent = true })
-- require('jirafa').setup()
