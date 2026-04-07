-- This is to set the number and relative number for the line
vim.opt.number = true
vim.opt.relativenumber = true
-- This will set some of the other options as well
vim.opt.cursorline = true --highlight current line
vim.opt.scrolloff = 10 --keep ten lines of code above or below cursor
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.cmdheight = 1
vim.opt.spelllang = { "en" }
-- This will set the tabbing and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true --this will use spaces
vim.opt.smartindent = true
vim.opt.autoindent = true --this will copy indent from the current line
vim.opt.grepprg = "rg --vimgrep" --use ripgrep if available
vim.opt.grepformat = "%f:1:%c:%m" --file,line number, col, content

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false --dont highlight the searches
vim.opt.incsearch = true --show matches as you type

-- Visual settings
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" --always show a sign column
vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.completeopt = "menuone,noinsert,noselect" --completion options
vim.opt.showmode = false --dont show in command line
vim.opt.pumheight = 10 --popup menu height
vim.opt.pumblend = 10 --popup menu transparency
vim.opt.winblend = 0 --floating window transparency
vim.opt.conceallevel = 0 --dont hide markup
vim.opt.concealcursor = "" --show markup even on cursor line
vim.opt.lazyredraw = false --redraw while executing macros
vim.opt.redrawtime = 10000 --timeout for syntax highlighting redraw
vim.opt.maxmempattern = 20000
vim.opt.synmaxcol = 300

--File handling(description i will add later)
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.diffopt:append("vertical")
vim.opt.diffopt:append("algorithm:patience")
vim.opt.diffopt:append("linematch:60")

local undodir = "~/.local/share/nvim/undodir"
vim.opt.undodir = vim.fn.expand(undodir)
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p")
end

-- Behavior Settings
vim.opt.errorbells = false -- Disable error sounds
vim.opt.backspace = "indent,eol,start" -- Make backspace behave naturally
vim.opt.autochdir = false -- Don't change directory automatically
vim.opt.iskeyword:append("-") -- Treat dash as part of a word
vim.opt.path:append("**") -- Search into subfolders with `gf`
vim.opt.selection = "inclusive" -- Use inclusive selection
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.modifiable = true -- Allow editing buffers
vim.opt.encoding = "UTF-8" -- Use UTF-8 encoding
vim.opt.wildmenu = true -- Enable command-line completion menu
vim.opt.wildmode = "longest:full,full" -- Completion mode for command-line
vim.opt.wildignorecase = true -- Case-insensitive tab completion in commands

-- Cursor Settings
vim.opt.guicursor = {
	"n-v-c:block", -- Normal, Visual, Command-line
	"i-ci-ve:block", -- Insert, Command-line Insert, Visual-exclusive
	"r-cr:hor20", -- Replace, Command-line Replace
	"o:hor50", -- Operator-pending
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes: blinking & highlight groups
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch mode
}

-- Folding Settings
vim.opt.foldmethod = "expr" -- Use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99 -- Keep all folds open by default

-- Split Behavior
vim.opt.splitbelow = true -- Horizontal splits open below
vim.opt.splitright = true -- Vertical splits open to the right
