-- File for applying neovim/vim settings
--

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set highlight on search:
vim.o.hlsearch = false

-- Have an absolute number on the current line, and relative numbers on:
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- Make line numbers default
-- vim.wo.number = true
-- Make relative line numbers default
-- vim.wo.relativenumber = true

-- Character width of line number gutter:
vim.wo.numberwidth = 5

-- Enable mouse mode:
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- What character to use for bullet points in a Markdown table of contents:
vim.g.vmt_list_item_char = "-"
-- Do not include the headings before where the table of contents is 
-- inserted in a Markdown file:
vim.g.vmt_include_headings_before = 0

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Enable spellcheck by default:
vim.o.spell = true
