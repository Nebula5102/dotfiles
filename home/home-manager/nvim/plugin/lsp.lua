local lspconfig = require('lspconfig')
--Enable Language Server
lspconfig.rnix.setup{}
lspconfig.lua_ls.setup{
	settings = {
		Lua = {
			runtime = {
				version = 'luaJIT',
			},
			diagnostics = {
				globals = {
					'vim',
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("",true),
			},
		},
	},
}
lspconfig.pyright.setup{}
--lspconfig.ccls.setup{
--	init_options = {
--    	compilationDatabaseDirectory = "build";
--    	index = {
--      		threads = 0;
--    	};
--    	clang = {
--     		excludeArgs = { "-frounding-math"} ;
--    	};
--  	}
--}
require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

--Autocompletion setup
require'compe'.setup{
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	source = {
		path = true;
		buffer = true;
		nvim_lsp = true;
		nvim_lua = true;
		tags = true;
		treesitter = true;
	};
}

--Set tab to accept autocompletion
local t = function(str)
	return vim.api.nvim_replace_termcodes(str,true,true,true)
end
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t "<C-n>"
	else
		return t "<S-Tab>"
	end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
