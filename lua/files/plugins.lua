local status, packer = pcall(require, "packer")

if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	-- Plugins got here ->
	use("wbthomason/packer.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- LSP UI
	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind-nvim")
	use("folke/lsp-colors.nvim")

	-- Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-cmdline", -- command line
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-nvim-lua", -- nvim config completions
			"hrsh7th/cmp-nvim-lsp", -- lsp completions
			"hrsh7th/cmp-path", -- file path completions
			"saadparwaiz1/cmp_luasnip", -- snippets completions
		},
	})

	-- Highlight syntax
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- Formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp",
	})
	use("rafamadriz/friendly-snippets")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-symbols.nvim")

	-- Explorer //  Use only for the coc-explorer
	use({
		"neoclide/coc.nvim",
		branch = "release", -- optional but strongly recommended
	})

	-- Utilities
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("axelvc/template-string.nvim")
	use("max397574/better-escape.nvim")
	use("leafOfTree/vim-matchtag")
	use({ "mg979/vim-visual-multi", branch = "master" })
	use("mattn/emmet-vim")
	use("windwp/nvim-spectre") -- Spectre for find and replace

	-- Motion
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})

	-- Comment
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("numToStr/Comment.nvim")

	-- tpope
	use("tpope/vim-fugitive")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")

	-- StatusLine
	use("nvim-lualine/lualine.nvim")
	use("akinsho/nvim-bufferline.lua")
	use("kyazdani42/nvim-web-devicons")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Colorizer
	use("roobert/tailwindcss-colorizer-cmp.nvim")
	use("brenoprata10/nvim-highlight-colors")
	use("NvChad/nvim-colorizer.lua")

	--Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Themes
	use("folke/tokyonight.nvim")
end)
