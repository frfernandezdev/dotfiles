local utils = require("utils")
local nnoremap = utils.nnoremap
local inoremap = utils.inoremap
local vnoremap = utils.vnoremap

-- Map <C-l> (redraw screen) to also turn off search highlighting until the
-- next search
nnoremap("<C-l>", ":nohl<CR><C-l>")
nnoremap("<A-d>", ":t .<CR>==")
inoremap("<A-d>", "<Esc>:t .<CR>==gi")
vnoremap("<A-d>", ":t$ <CR>gv=gv")

-- Move lines
nnoremap("<A-j>", ":m .+1<CR>==")
nnoremap("<A-k>", ":m .-2<CR>==")
inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
vnoremap("<A-j>", ":m '>+1<CR>=gv")
vnoremap("<A-k>", ":m '<-2<CR>=gv")

-- Shifting blocks visually
nnoremap("<Tab>", ">>_")
nnoremap("<S-Tab>", "<<_")
inoremap("<S-Tab>", "<C-D>")
vnoremap("<Tab>", ">gv")
vnoremap("<S-Tab>", "<gv")

-- Move between tabs
nnoremap("th", ":tabprevious<CR>")
nnoremap("tl", ":tabnext<CR>")

-- Save
nnoremap("<C-s>", ":w<CR>")
inoremap("<C-s>", "<Esc>:w <CR>")
vnoremap("<C-s>", ":w<CR>")

