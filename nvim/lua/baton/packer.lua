-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use {
        'sainnhe/gruvbox-material',

		config = function()
			vim.cmd([[let g:gruvbox_material_background = 'medium']])
			vim.cmd([[colorscheme gruvbox-material]])
		end
    }

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-nvim-lsp')
	use('L3MON4D3/LuaSnip')
	use('nvim-treesitter/playground')
	use('mbbill/undotree')
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
    use {
        'nvim-tree/nvim-tree.lua',
        'nvim-tree/nvim-web-devicons'
    }
end)
