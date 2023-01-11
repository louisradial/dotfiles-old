return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'EdenEast/nightfox.nvim'
    use 'ellisonleao/gruvbox.nvim'

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'saadparwaiz1/cmp_luasnip'},

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}
	use 'j-hui/fidget.nvim'
	use 'simrat39/rust-tools.nvim'
    use 'folke/neodev.nvim'

	-- telescope fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
	-- use { "nvim-telescope/telescope-file-browser.nvim" }

	-- treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'nvim-treesitter/playground' }

	-- colorscheme
	-- use {
	--	'navarasu/onedark.nvim',
	--	config = function() vim.cmd 'colorscheme onedark' end
	--}

	-- use 'norcalli/nvim-colorizer.lua'
	use 'lukas-reineke/indent-blankline.nvim'

	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',
		--after = 'tokyonight',
		requires = { 'nvim-tree/nvim-web-devicons', opt = false },
	}
	use 'nvim-tree/nvim-tree.lua'

	-- mini.nvim
	use {
        'echasnovski/mini.nvim',
        requires = { 'lewis6991/gitsigns.nvim', opt = false},
    }

    -- float terminal
    use 'akinsho/toggleterm.nvim'
end)
-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
-- 	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
-- 	group = packer_group,
-- 	pattern = vim.fn.expand '$MYVIMRC',
-- })
