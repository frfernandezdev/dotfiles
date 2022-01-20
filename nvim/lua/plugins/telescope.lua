local telescope = require("telescope")
local utils = require("utils")
local nnoremap = utils.nnoremap

telescope.setup(
  {
    pickers = {
      find_files = {
        theme = "dropdown"
      },
      live_grep = {
        theme = "cursor"
      },
      buffers = {
        theme = "cursor"
      }
    }
  }
)

nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
nnoremap("<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
nnoremap("<leader>fa", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>")
nnoremap("<leader>fd", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>")
nnoremap("<leader>ft", "<cmd>lua require('telescope.builtin').treesitter()<cr>")

--nnoremap("<leader>gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
--nnoremap("<leader>gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")
--nnoremap("<leader>gt", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>")

nnoremap("<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>")
nnoremap("<leader>gd", "<cmd>lua require('telescope.builtin').git_branches()<cr>")
nnoremap("<leader>gst", "<cmd>lua require('telescope.builtin').git_status()<cr>")
nnoremap("<leader>gstl", "<cmd>lua require('telescope.builtin').git_stash()<cr>")
