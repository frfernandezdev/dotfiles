local tree = require("nvim-tree")
local utils = require("utils")
local nnoremap = utils.nnoremap
local g = vim.g

tree.setup(
  {
    update_to_buf_dir = {
      enable = true
    },
    update_focused_file = {
      enable = true
    },
    view = {
      width = 30,
      side = "left",
      auto_resize = true,
      number = false,
      relativenumber = false
    }
  }
)

-- Mappings
nnoremap("<C-n>", ":NvimTreeToggle<CR>")
nnoremap("<leader>r", ":NvimTreeRefresh<CR>")
nnoremap("<leader>n", ":NvimTreeFindFile<CR>")

g.nvim_tree_indent_markers = 1
