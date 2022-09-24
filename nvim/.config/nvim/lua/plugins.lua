local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
	group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
	pattern = 'plugins.lua',
	command = 'source <afile> | PackerCompile',
})

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		"Pocco81/auto-save.nvim",
		config = function() require('plugins.auto-save') end,
	}

	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig"
	}

	-- CMP plugins
	use {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip"
	}

	-- Snippets
	use {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets"
	}

	use {
		'RRethy/vim-illuminate',
		config = function() require('plugins.illuminate') end
	}

	-- Buffer line
	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require("plugins.bufferline")
		end
	}

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function() require('plugins.lualine') end
	}

	-- File Picker
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		requires = 'nvim-lua/plenary.nvim'
	}

	-- Theme
	use { "catppuccin/nvim", as = "catppuccin",
		config = function() require('plugins.catppuccin') end
	}

	-- Highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		config = function() require('plugins.treesitter') end
	}

	use {
		'numToStr/Comment.nvim',
		config = function() require('plugins.comment') end
	}


	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
