local tree = require("nvim-tree")
local utils = require("utils")
local nnoremap = utils.nnoremap
local g = vim.g
local cmd = vim.cmd

tree.setup({
	view = {
		preserve_window_proportions = true
	},
	actions = {
		open_file = {
			quit_on_open = true,
			resize_window = true
		}
	}
})

-- Mappings
nnoremap("<C-n>", ":NvimTreeToggle<CR>")
nnoremap("<leader>r", ":NvimTreeRefresh<CR>")
nnoremap("<leader>n", ":NvimTreeFindFile<CR>")

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1

--cmd [[ highlight NvimTreeFolderIcon guibg=blue ]]
