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

	-- cache modules to improve load time
	use 'lewis6991/impatient.nvim'


	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig"
	}

	-- Code Completion
	use {
		"ms-jpq/coq_nvim",
		branch = "coq",
		requires = {
			{
				"ms-jpq/coq.artifacts",
				branch = "artifacts"
			},
			{
				"ms-jpq/coq.thirdparty",
				branch = "3p"
			}
		}
	}

	-- Utility
	use {
		'echasnovski/mini.nvim',
		config = function() require('plugins.mini') end
	}

	use {
		"NvChad/nvim-colorizer.lua",
		config = function() require('plugins.colorizer') end
	}

	use {
		"ray-x/lsp_signature.nvim",
		config = function() require('plugins.signature') end
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

	-- File Finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'xiyaowong/telescope-emoji.nvim', -- Emojis
			'BurntSushi/ripgrep'
		},
		config = function() require('plugins.telescope') end
	}

	-- File Explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		tag = 'nightly', -- optional, updated every week. (see issue #1193)
		config = function() require("nvim-tree").setup() end
	}

	use {
		"lvimuser/lsp-inlayhints.nvim",
		config = function() require('plugins.inlayhints') end
	}

	-- Theme
	use {
		"catppuccin/nvim", as = "catppuccin",
		config = function() require('plugins.catppuccin') end
	}

	-- Highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		config = function() require('plugins.treesitter') end
	}


	-- Spell Checker
	-- Note: Remove this once you update to v8
	use {
		'lewis6991/spellsitter.nvim',
		config = function() require('spellsitter').setup() end
	}

	-- Create missing folders on save
	use {
		'jghauser/mkdir.nvim'
	}


	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
