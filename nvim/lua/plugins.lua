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
	"nvim-treesitter/nvim-treesitter",
	event = "BufRead",
	config = function()
	    require("config.treesitter")
	end,
    },

    ---Themes---

    -- kanagawa theme
   -- {
   --     "rebelot/kanagawa.nvim",
   --     lazy = false, --load immediately
   --     priority = 1000, -- load as early as possible
   --     config = function()
   --         require("config.kanagawa")
   --         vim.cmd([[colorscheme kanagawa]])
   --     end,
   -- },
    -- nordic theme
   -- {
   --     'AlexvZyl/nordic.nvim',
   --     lazy = false,
   --     priority = 1000,
   --     config = function()
   --         require("config.nordic")
   --         vim.cmd([[colorscheme nordic]])
   --     end,
   -- },
    -- nord theme
    {
        'shaunsingh/nord.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require("config.nord")
            vim.cmd([[colorscheme nord]])
        end,
    },

    ---Themes---
    
    -- Telescope
    {
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		cmd = "Telescope",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("config.telescope")
		end,
	},
    
    -- Fancy statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("config.lualine")
		end,
	},
    
    -- In-line diagnostics
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			icons = true,
		},
	},

    -- Show indentation levels
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("config.indent")
		end,
	},
    
    -- Formatter
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("config.conform")
		end,
	},
    
    -- Quick file switcher
	{ "theprimeagen/harpoon" },

    -- File Tree Viewer
    	{
    	"nvim-tree/nvim-tree.lua",
    	version = "*",
    	lazy = false,
    	dependencies = {
        	"nvim-tree/nvim-web-devicons",
    	},
    	config = function()
        	require("config.nvim-tree")
    	end,
    	},
    
    -- LSP
	{
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp")
        end,
	},
})
