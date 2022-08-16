require 'mappings'

-- plugin section
local run_setup = function()
	require("Comment").setup {
		-- LHS of operator-pending mapping in NORMAL + VISUAL mode
		opleader = {
			-- line-comment keymap
			line = "gc",
			-- block-comment keymap
			block = "gb",
		},

		-- Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
		mappings = {

			-- operator-pending mapping
			-- Includes:
			--  `gcc`               -> line-comment  the current line
			--  `gcb`               -> block-comment the current line
			--  `gc[count]{motion}` -> line-comment  the region contained in {motion}
			--  `gb[count]{motion}` -> block-comment the region contained in {motion}
			basic = true,

			-- extra mapping
			-- Includes `gco`, `gcO`, `gcA`
			extra = true,

			-- extended mapping
			-- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
			extended = true,
		},

		-- LHS of toggle mapping in NORMAL + VISUAL mode
		toggler = {
			-- line-comment keymap
			--  Makes sense to be related to your opleader.line
			line = "gcc",

			-- block-comment keymap
			--  Make sense to be related to your opleader.block
			block = "gbc",
		},

		-- Pre-hook, called before commenting the line
		--    Can be used to determine the commentstring value
		pre_hook = nil,

		-- Post-hook, called after commenting is done
		--    Can be used to alter any formatting / newlines / etc. after commenting
		post_hook = nil,

		-- Can be used to ignore certain lines when doing linewise motions.
		--    Can be string (lua regex)
		--    Or function (that returns lua regex)
		ignore = nil,
	}

	local comment_ft = require "Comment.ft"
	comment_ft.set("lua", { "--%s", "--[[%s]]" })
end

-- These plugins will run no matter what
require 'vscode_compat_plugins'
-- if this is running in a vscode session, stop right here
if vim.fn.exists('g:vscode') == 1 then
	vim.call('plug#end')
	run_setup()
	return
end
-- more plugins
require 'plugins'

run_setup()

-- require 'pluginmaps'
-- function nvim_create_augroups(definitions)
-- 	for group_name, definition in pairs(definitions) do
-- 		vim.api.nvim_command('augroup '..group_name)
-- 		vim.api.nvim_command('autocmd!')
-- 		for _, def in ipairs(definition) do
-- 			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
-- 			vim.api.nvim_command(command)
-- 		end
-- 		vim.api.nvim_command('augroup END')
-- 	end
-- end

vim.cmd [[
set omnifunc=syntaxcomplete#Complete
set modifiable
]]

local mapfuncs = require('mapfunctions')
local nmap = mapfuncs.nmap
local vmap = mapfuncs.vmap

------------
-- ThePrimeagen/refactoring.nvim
------------

-- Remaps for each of the four debug operations currently offered by the plugin
vmap("<Leader>re", [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]])
vmap("<Leader>rf", [[<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]])
vmap("<Leader>rv", [[<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]])
vmap("<Leader>ri", [[<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]])

-----------
vim.cmd [[
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

]]
nmap("<leader>v","<cmd>NERDTreeToggle<cr>")
nmap('>', ':TablineBufferNext<cr>')

-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.api.nvim_set_keymap(
	"n",
	"<leader>rp",
	":lua require('refactoring').debug.printf({below = false})<CR>",
	{ noremap = true }
)

-- Print var: this remap should be made in visual mode
vmap("<leader>rv", ":lua require('refactoring').debug.print_var({})<CR>")

-- Cleanup function: this remap should be made in normal mode
nmap("<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>")

------- Other stuff

-- nmap('<', ':TablineBufferPrevious<cr>')
-- vim.cmd [[colorscheme tokyonight]]

vim.g.mundo_prefer_python3 = 1

nmap("<silent>", ",g :MundoToggle<CR>")

-- themes
-- let g:tokyonight_style = "night"

vim.o.background = "dark" -- or "light" for light mode
-- colorscheme tokyonight

--"" telescope.nvim

-- Find files using Telescope command-line sugar.
-- nmap("<leader>p", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
-- wont work without ripgrep (I need to move to Unix first)
-- nmap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")

-- Markdown preview
nmap("<C-a>", "<Plug>MarkdownPreview")
nmap("<C-p>", "<Plug>MarkdownPreviewToggle")
vim.cmd [[let g:mkdp_auto_start = 0]]
