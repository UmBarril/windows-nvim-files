------- Library plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim' -- dependency of telescope.nvim
-- Plug 'nvim-lua/popup.nvim' ??

-------- Pretty plugins
-- most popular File/folder tree plugin. Sometimes I use it, sometimes don't
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'Xuyuanp/nerdtree-git-plugin'


-- same thing as ryanoasis/vim-devicon, but has compatibility with lua plugins
Plug 'kyazdani42/nvim-web-devicons'
Plug 'RRethy/vim-illuminate' -- highlights other uses of the same word

-- need to install golang to use it
-- Plug 'RRethy/vim-hexokinase' -- colorizes rgbs

Plug 'lukas-reineke/indent-blankline.nvim' -- indent lines
-- Plug 'akinsho/bufferline.nvim'
-- Plug 'SmiteshP/nvim-gps'
Plug 'kdheepak/tabline.nvim'
Plug 'nvim-lualine/lualine.nvim'
-- sbdchd/neoformat seems not so useful, but i'll leave it here just in case i need it later
-- flazz/vim-colorschemes ?
Plug 'ap/vim-css-color' -- hexokinase but no golang :)

-- themes
-- Plug 'vim-conf-live/vimconflive2021-colorscheme'
-- Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
-- Plug 'tjdevries/colorbuddy.nvim'
-- Plug 'tjdevries/gruvbuddy.nvim'

-------- Ai
-- Plug 'jameshiew/nvim-magic'
-- Plug github copilot?

-------- Functional plugins
Plug 'folke/trouble.nvim' -- testing if its good

-- Plug 'ThePrimeagen/harpoon'

-- TODO: Start using this
-- Plug 'tjdevries/astronauta.nvim' -- Lua keymap DSL
Plug 'mhinz/vim-startify' -- vim startup page

Plug 'puremourning/vimspector' -- vim debugger

-- Plug 'lewis6991/impatient.nvim' TODO: set this thing up

-- Plug 'dstein64/vim-startuptime' -- TODO: Uncomment when you use it
-- Plug 'junegunn/limelight.vim' -- Focuses on the paragraph you selected
-- Plug 'simnalamburt/vim-mundo' -- undo tree

-- not so stabilished and I would have to download LS COLORS
-- Plug('ms-jpq/chadtree', {['branch'] = 'chad', ['do'] = 'python3 -m chadtree deps'})

-- Plug 'kyazdani42/nvim-tree.lua'

-- Plug 'renerocksai/telekasten.nvim' -- TODO: learn more about this plugin
Plug 'nvim-telescope/telescope.nvim' -- fuzzy finder

-- Plug 'nvim-telescope/telescope-fzf-native.nvim' -- plugins for telestocope.nvim
-- Plug 'nvim-telescope/telescope-media-files.nvim' --  see preview for videos,image,pdf etc
-- more extensions: https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions

Plug 'psliwka/vim-smoothie' -- moving smoothly with c-d and c-u
Plug 'Konfekt/FastFold' -- better performace folding
Plug 'cohama/lexima.vim' -- close parentheses
-- Plug 'jiangmiao/auto-pairs'-- test if better than lexima later TODO

-- TODO: set this thing up
-- Plug 'lewis6991/impatient.nvim' -- improve startuptime for nvim

-- Plug 'phaazon/hop.nvim' ?

-- TODO: uncomment this and learn how to use it
-- Plug 'tpope/vim-dispatch' -- <- Build and test helper TODO: learn how to use it too
-- Plug 'tpope/vim-obsession' config

-- tpope/vim-eunuch TODO: check if it works onn windows

-- gitplugins
-- Plug 'lewis6991/gitsigns.nvim' -- better gitgud
-- Plug 'tpope/vim-fugitive' -- <- Git frontend
-- Plug 'tpope/vim-rhubarb' -- <- fugitive++
-- Plug 'AndrewRadev/diffurcate.vim' git diff

-------- Language
-- vscode snipets (????????????)
--
Plug 'hrsh7th/vim-vsnip'
-- Plug 'hrsh7th/cmp-vsnip'
-- Plug 'hrsh7th/vim-vsnip-integ'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'ThePrimeagen/refactoring.nvim' -- TODO: learn how to use it

---- lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim' --  bridges mason.nvim with the lspconfig plugin 
-- Plug 'williamboman/nvim-lsp-installer' -- deprecated
Plug 'williamboman/mason.nvim' -- lsp-installer substitute
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'simrat39/symbols-outline.nvim'

-- Apparently doesn't work well on windows :(
-- Plug 'folke/lsp-colors.nvim' -- make gruvbox work as it should

-- Plug 'glepnir/lspsaga.nvim' unmanteined
Plug 'tami5/lspsaga.nvim' -- manteined fork of lspsaga (but still with some bugs)


---- autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'mattn/emmet-vim' -- html (https://emmet.io/)
Plug 'PProvost/vim-ps1' -- powershell
Plug 'dhruvasagar/vim-table-mode' -- markdown
-- markdown
-- Plug('iamcco/markdown-preview.nvim', {['for'] = 'markdown'}) -- [, 'vim-plug']
Plug 'vimwiki/vimwiki' -- markdown TODO: learn more how to use it
Plug 'prashanthellina/follow-markdown-links' -- markdown

vim.call('plug#end')

-- require("lsp-colors").setup({
--   Error = "#db4b4b",
--   Warning = "#e0af68",
--   Information = "#0db9d7",
--   Hint = "#10B981"
-- })

-- trouble
require("trouble").setup {  }
require"mapfunctions".nmap('<A-t>', ':Trouble<cr>')

-- telescope
require('telescope').setup {
  defaults = {
	file_ignore_patterns = {"autoload"}
  },
  pickers = {
    find_files = {
      -- theme = "dropdown",
    }
  },
  extensions = {
    -- ...
  }
}

vim.cmd [[colorscheme gruvbox]]

require'luasnip'.filetype_extend("ruby", {"rails"})

-- Treesitter/Lsp config

--  COPIED FROM (nvim-lua/kickstart.nvim/blob/master/init.lua)
-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall

require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = false,
		["foo.bar"] = "Identifier",
		["TODO"] = "Identifier",
		["BUG"] = "Identifier",
		["ERROR"] = "Identifier",
		["DONE"] = "Identifier",
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gnn',
			node_incremental = 'grn',
			scope_incremental = 'grc',
			node_decremental = 'grm',
		},
	},
	indent = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
	},
	-- treesitter playground conf (nvim-treesitter/playground)
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = {"BufWrite", "CursorHold"},
	},
}
-- enable tree-sitter based folding
vim.cmd [[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]]

-- more lsp configuration...
require 'lspNcmp'

require'lspsaga'.init_lsp_saga {}

function getTermLanguageByFileType()
	-- if vim.bo.filetype == 'python' then
	-- 	return 'py'
	-- end
	return 'pwsh'
end

-- TODO: CONFIGURE THIS
vim.cmd [[
""""""" Async Lsp Finder
" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" or use command LspSagaFinder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>

""""""" Code action
nnoremap <silent> <leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent> <leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

"""""" HOVER DOC
"" show hover doc
" nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
"" or use command
nnoremap <silent> K :Lspsaga hover_doc<CR>

"" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
"" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

"" RENAME
" rename
nnoremap <silent> gr <cmd>lua require('lspsaga.rename').rename()<CR>
" close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`

""  SIGNATUREHELP
" show signature help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

" and you also can use smart_scroll_with_saga to scroll in signature help win

"""""" PREVIEW DEF
" preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

" "can use smart_scroll_with_saga to scroll

"""""" JUMP DIAGNOSTIC AND SHOW DIAGNOSTICS
"" show
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" only show diagnostic if cursor is over the area
nnoremap <silent> <leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

"""""" FLOAT TERMINAL
""float terminal also you can pass the cli command in open_float_terminal function
" or open_float_terminal('lazygit')<CR>
nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal(getTermLanguageByFileType())<CR>
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>

" """"""  RENAME
" "" rename
" nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
" "" or command
" nnoremap <silent>gr :Lspsaga rename<CR>
" "" close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`

]]

-----
--- Other Pluings
-----

-- vim-illuminate config MORE(https://github.com/RRethy/vim-illuminate)
vim.g.Illuminate_delay = 300

-- default 1
-- vim.g.Illuminate_highlightUnderCursor = 0

vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]
vim.opt.list = true

-- indent_blackline config
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false

require("indent_blankline").setup {
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = true,
	-- show_current_context_start = true,
}

require'lualine'.setup {
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { require'tabline'.tabline_buffers },
		lualine_x = { require'tabline'.tabline_tabs },
		lualine_y = {},
		lualine_z = {},
	},
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = {}
}

require'tabline'.setup {
	-- Defaults configuration options
	enable = true,
	options = {
		--                   -- If lualine is installed tabline will use separators configured in lualine by default.
		-- These options can be used to override those settings.
		section_separators = {'', ''},
		component_separators = {'', ''},
		max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
		show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
		show_devicons = true, -- this shows devicons in buffer section
		show_bufnr = false, -- this appends [bufnr] to buffer section,
		show_filename_only = false, -- shows base filename only instead of relative path in filename
	}
}

vim.cmd[[
set guioptions-=e " Use showtabline in gui vim
set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]
