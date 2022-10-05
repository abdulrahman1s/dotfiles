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

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 50

-- Enable Spell Checking
opt.spell = true

opt.cmdheight = 1

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Auto start COQ
g.coq_settings = { auto_start = 'shut-up' }
