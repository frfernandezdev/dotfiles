-- init.lua
-- Neovim-specific configuration
require("globals")
local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local env = vim.env
local utils = require("utils")
local termcodes = utils.termcodes

-- create a completion_nvim table on _G which is visible via
-- v:lua from vimscript
_G.completion_nvim = {}

function _G.completion_nvim.smart_pumvisible(vis_seq, not_vis_seq)
  if (fn.pumvisible() == 1) then
    return termcodes(vis_seq)
  else
    return termcodes(not_vis_seq)
  end
end

-- General
----------------------------------------------------------------
opt.backup = false -- don't use backup files
opt.writebackup = false -- don't backup the files while editing
opt.swapfile = false -- don't create swap files for new buffers
opt.updatecount = 0 -- don't write swap files after some number of updates

opt.backupdir = {
  "~/.vim-tmp",
  "~/.tmp",
  "~/tmp",
  "/var/tmp",
  "/tmp"
}

opt.directory = {
  "~/.vim-tmp",
  "~/.tmp",
  "~/tmp",
  "/var/tmp",
  "/tmp"
}

opt.history = 10000 -- store the last 1000 commands entered
opt.textwidth = 120 -- after configured number of characters, wrap line

opt.inccommand = "nosplit" -- show the results of substition as they're happening
-- but don't open a split

opt.backspace = {"indent", "eol,start"} -- make backspace behave in a sane manner
opt.clipboard = {"unnamed", "unnamedplus"} -- use the system clipboard

-- searching
opt.ignorecase = true -- case insensitive searching
opt.smartcase = true -- case-sensitive if expresson contains a capital letter
opt.hlsearch = true -- highlight search results
opt.incsearch = true -- set incremental search, like modern browsers
opt.lazyredraw = false -- don't redraw while executing macros
opt.magic = true -- set magic on, for regular expressions

if fn.executable("rg") then
  -- if ripgrep installed, use that as a grepper
  opt.grepprg = "rg --vimgrep --no-heading"
  opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- error bells
opt.errorbells = false
opt.visualbell = true
opt.timeoutlen = 500

-- Appearance
---------------------------------------------------------
opt.cursorline = true -- show cursor line
opt.number = true -- show line numbers
opt.relativenumber = true -- show relative line number
opt.wrap = true -- turn on line wrapping
opt.wrapmargin = 8 -- wrap lines when coming within n characters from side
opt.linebreak = true -- set soft wrapping
opt.showbreak = "↪"
opt.autoindent = true -- automatically set indent of new line
opt.ttyfast = true -- faster redrawing
opt.laststatus = 2 -- show the status line all the time
opt.scrolloff = 7 -- set 7 lines to the cursors - when moving vertical
opt.wildmenu = true -- enhanced command line completion
opt.hidden = true -- current buffer can be put into background
opt.showcmd = true -- show incomplete commands
opt.showmode = true -- don't show which mode disabled for PowerLine
opt.wildmode = {"list", "longest"} -- complete files like a shell
opt.shell = env.SHELL
opt.cmdheight = 1 -- command bar height
opt.title = true -- set terminal title
opt.showmatch = true -- show matching braces
opt.mat = 2 -- how many tenths of a second to blink
opt.updatetime = 300
opt.signcolumn = "yes"
opt.shortmess = "atToOFc" -- prompt message options

-- Tab control
opt.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
opt.tabstop = 2 -- the visible width of tabs
opt.softtabstop = 2 -- edit as if the tabs are 4 characters wide
opt.shiftwidth = 2 -- number of spaces to use for indent and unindent
opt.shiftround = true -- round indent to a multiple of 'shiftwidth'

-- Code folding settings
cmd [[set foldmethod=expr]] -- use treesitter folding support
cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
--opt.foldlevelstart = 99
--opt.foldnestmax = 10 -- deepest fold is 10 levels
opt.foldenable = false -- don't fold by default
opt.foldlevel = 1

-- toggle invisible characters
opt.list = true
opt.listchars = {
  tab = "→ ",
  eol = "¬",
  trail = "⋅",
  extends = "❯",
  precedes = "❮"
}

cmd [[
  augroup numbertoggle
	  autocmd!
	  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
]]

-- Mappings
opt.pastetoggle = "<F11>"

cmd [[syntax on]]
cmd [[filetype plugin indent on]]

require("mappings")

--  Plugins
require("plugins")
