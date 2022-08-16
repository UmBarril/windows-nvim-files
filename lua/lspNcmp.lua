---------------------
-- cmp.nvim config --
---------------------

-- LSP settings
local maps_on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local opts = { noremap = true, silent = true }

	local buf_map = function(mapping, cmd)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', mapping, cmd, opts)
	end
 
	buf_map('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
	buf_map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
	buf_map('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
	buf_map('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	buf_map('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
	buf_map('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
	buf_map('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
	buf_map('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
	buf_map('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
	buf_map('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
	buf_map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
	buf_map('<C-.>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
	buf_map('<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
	buf_map('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
	buf_map(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
	-- buf_map(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	buf_map('<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.cmd [[ 
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'sql'] 
]]

require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		on_attach = function(client)
			maps_on_attach()
			require 'illuminate'.on_attach(client)
		end,
		capabilities = capabilities,
	}
	if server.name == "sumneko_lua" then
		local runtime_path = vim.split(package.path, ';')
		table.insert(runtime_path, 'lua/?.lua')
		table.insert(runtime_path, 'lua/?/init.lua')
		local nvim_runtime = vim.api.nvim_get_runtime_file('', true)
		opts.settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					-- and fix 'Undefined global `vim`' errors
					globals = { 'vim' },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = nvim_runtime,
					-- stop annoying third party library messages
					checkThirdParty = false,
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = { enable = false },
			}
		}
		-- elseif server.name == 'vimls' then
		-- ...
	elseif server.name == "pyright" then
		-- opts.settings = {
		-- 	python = {
		-- 		pythonPath = vim.g.python3_host_prog,
		-- 		-- pythonPath = "C:/Program Files/Python310/python.exe",
		-- 	},
		-- }
	end
	server:setup(opts)
end)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local lspkind = require('lspkind')
lspkind.init({
	-- enables text annotations
	with_text = true,

	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	-- default: 'default'
	preset = 'codicons',

	-- override preset symbols
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = ""
	},
})

local cmp = require'cmp'
cmp.setup {
	formatting = {
		-- Youtube: How to set up nice formatting for your sources.
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
				gh_issues = "[issues]",
				tn = "[TabNine]",
			},
		},
	},
	experimental = {
		native_menu = false,
		ghost_text = false,
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
		end,
	},
	mapping = {
		-- {'i', 'c'} means it works in insert and c mode
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({ select = true }),

		-- I know what it's in :h ins-completion, I don't care, just do it with tab
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	},
	sources = {
		-- { name = 'gh_sources' }, ????
		-- { name = 'nvim_lsp', priority = 50, keyword_length = 5 },
		{ name = 'nvim_lsp' }, -- use built-in lsp client
		{ name = 'nvim_lua' },
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}
}

-- TODO: If I ever start using tpope's dadbod I'll enable it
-- _ = vim.cmd [[
--    augroup DadbodSql
--       au!
--       autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
--    augroup END
-- ]]

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	completion = {
		-- Might allow this later, but I don't like it right now really.
		-- Although, perhaps if it just triggers w/ @ then we could.
		--
		-- I will have to come back to this.
		autocomplete = false,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
	}, {
			-- { name = "buffer", keyword_length = 5 },
			{ name = 'buffer' },
		}),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--    sources = {
--       { name = 'path' },
--       { name = 'cmdline' }
--    }
-- })

