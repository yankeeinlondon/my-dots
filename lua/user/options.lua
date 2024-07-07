-- [[ Setting options ]]
-- See `:help vim.o`

-- add "-" so that dasherized variables are selected as one word
vim.opt.iskeyword:append "-"
local o = vim.o
local wo = vim.wo

-- Make line numbers default
wo.number = true
wo.signcolumn = 'yes'
wo.relativenumber = true

-- Explorer
vim.g.loaded_netrw = 1       -- disable
vim.g.loaded_netrwPlugin = 1 -- disable
-- True Colors
o.termguicolors = true
-- whitespace
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
-- vim.o.clipboard:append "unnammedplus"

-- Set highlight on search
o.hlsearch = false

-- Enable mouse mode
o.mouse = 'a'
-- Enable break indent
o.breakindent = true
-- Save undo history
o.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time
o.updatetime = 250

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- VIM Commands
vim.cmd [[
let g:markdown_fenced_languages = ['javascript','json', 'html', 'typescript', 'rust', 'bash', 'lua', 'vue', 'python']
]]
-- Enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 2

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Disable text wrap
vim.opt.wrap = false

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease updatetime to 200ms
vim.opt.updatetime = 50

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable persistent undo history
vim.opt.undofile = true

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable access to System Clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Enable cursor line highlight
vim.opt.cursorline = true
-- Set cursor to blink in insert mode
vim.cmd [[
let &t_SI = "\e[5 q"
]]

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- Place a column line
vim.opt.colorcolumn = "100"

-- Always show the sign column
vim.opt.signcolumn = "yes"
