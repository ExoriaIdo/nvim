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
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.listchars:append("space:⋅")
opt.fillchars:append("vert:│")

opt.foldmethod = 'indent'
opt.foldlevel = 99
opt.foldenable = true

opt.list = true
opt.listchars = "leadmultispace:⋅,trail:·"

-- colorscheme
require('jirafa').setup()
