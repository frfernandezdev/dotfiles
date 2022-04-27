local cmd = vim.cmd
local treesitter = require("nvim-treesitter.configs")

treesitter.setup(
  {
    ensure_installed = "all",
    autotag = {
      enable = true
    },
    indent = {
      enable = true,
      disable = {"yaml"}
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
			custom_captures = {
				--["keyword"] = "TSString"
			}
    },
    incremental_selection = {
      enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm"
			}
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil
    },
  }
)

cmd [[hi rainbowcol1 guifg=#123456]]

-- Code folding settings
vim.api.nvim_exec([[ 
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
]], true)
