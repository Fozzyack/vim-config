require("FConfig")


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'kyazdani42/blue-moon',
		config = function()
			vim.cmd([[colorscheme blue-moon]])
		end
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{'ThePrimeagen/harpoon'},
	{
		"sontungexpt/sttusline",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = { "BufEnter" },
		config = function(_, opts)
			require("sttusline").setup {

				statusline_color = "StatusLine",
				laststatus = 3,
				disabled = {
					filetypes = {
					},
					buftypes = {
					},
				},
				components = {
					"mode",
					"filename",
					"git-branch",
					"git-diff",
					"%=",
					"diagnostics",
					"lsps-formatters",
					"copilot",
					"indent",
					"encoding",
					"pos-cursor",
					"pos-cursor-progress",
				},
			}
		end,
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{'hrsh7th/cmp-nvim-lsp'},
		}
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{'L3MON4D3/LuaSnip'}
		},
	},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

})

