local opt = vim.o
local g = vim.g

-- Enable mouse selection
opt.mouse = "a"

-- Show line number relatively
opt.relativenumber = true
-- Show current line number
opt.nu = true

-- Use system clipboard
opt.clipboard = 'unnamedplus'
-- Wrap lines
opt.wrap = false

-- No highliting search after hitiing enter
opt.hlsearch = false

opt.scrolloff=8

-- [Tab] will insert 4 spaces
opt.tabstop = 4

-- Enable Spell Checking
opt.spell = true

opt.cmdheight = 1

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Auto start COQ
g.coq_settings = { auto_start = 'shut-up' }
