-- vim.o general settings
-- vim.wo window scoped options
-- vim.bo buffer scoped options
-- set all options above

-- vim.g global variables
-- vim.env gets or sets enviornment variables

-- vim.inspect() returns the value inside any variables above

-- vim.fn.function() calls a vim function

-- vim.cmd[[]] run vimscript

-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

-- HOME = os.getenv("HOME")
-- if vim.fn.has('win32') then
--    HOME = os.getenv("USERPROFILE")
-- end
-- NVIMDIR = HOME .. "/AppData/Local/nvim"

local set = vim.opt_global

-- Specify the behavior when switching between buffers
-- try
--     set switchbuf=useopen,usetab,newtab
--     set stal=2
-- catch
-- endtry

-- Folds are open when you open a file
-- set.fold = true

-- Lets me use the mouse just like any other text editor
set.mouse = 'a'

-- Use Unix as the standard file type
set.ffs = 'unix,dos,mac'
set.cmdheight = 1
--* set.foldcolumn = 1

-- Sets how many lines of history VIM has to remember
set.history = 500

-- Set to auto read when a file is changed from the outside
set.compatible = false
set.incsearch = true
set.ruler = true
set.backspace = 'indent,eol,start'
set.autoread = true

--Save undo history
vim.opt.undofile = true

vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
--Enable break indent
vim.o.breakindent = true
-- FROM https://www.youtube.com/watch?v=XA2WjJbmmoM
set.path = set.path + '**'

set.magic = true
set.textwidth = 1000

set.showmatch = true		-- Highlight matching brace
set.visualbell = true		-- Use visual bell (no beeping)

set.hlsearch = true	                -- Highlight all search results
set.smartcase = true		-- Enable smart-case search
set.ignorecase = true		-- Always case-insensitive

set.wrap = false
set.lbr = false
-- set.linebreak  = true		-- Break lines at word (requires Wrap lines)
-- set.showbreak = '+++'            -- Wrap-broken line prefix

set.smartindent = true		-- Enable smart-indent

set.colorcolumn = '80'
set.list = true
set.relativenumber = true
set.number = true
set.termguicolors = true

vim.g.markdown_folding = 1

vim.g.BASH_Ctrl_j = 'off'
-- Defining python executable path for language server
vim.g.python3_host_prog = "C:/Program Files/Python310/python.exe"
vim.g.loaded_python_provider = 0
-- Defining firefox as the browser to use when pessing gx
vim.g.netrw_browsex_viewer = "C:/Program Files/Mozilla Firefox/firefox.exe"

vim.g.markdown_fenced_languages = { 'vim', 'help' }

vim.g.vimsyn_embed = 'l'
