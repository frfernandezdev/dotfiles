local home = os.getenv("HOME")
local formatter = require("formatter")

local src_node = home .. "/.nvm/versions/node/v16.14.2/bin/"

formatter.setup(
	{
    filetype = {
      javascript = {
        function()
          return {
            exe = src_node .. "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
      },
      javascriptreact = {
        function()
          return {
            exe = src_node .. "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
      },
      typescript = {
        function()
          return {
            exe =  src_node .. "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
      },
      typescriptreact = {
        function()
          return {
            exe = src_node .. "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = src_node .. "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      python = {
        -- Configuration for psf/black
        function()
          return {
            exe = "black", -- this should be available on your $PATH
            args = {"-"},
            stdin = true
          }
        end
      },
      java = {
        function()
          return {
            exe = "/home/linuxbrew/.linuxbrew/bin/google-java-format",
            args = {
              "--add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED",
              "--add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED",
              "--add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED",
              "--add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED",
              "--add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
              "-"
            },
            stdin = true
          }
        end
      }
    }
  }
)

local utils = require("utils")
local nnoremap = utils.nnoremap

nnoremap("<C-f>", ":FormatWrite<CR>")

--vim.api.nvim_exec(
--  [[
--  augroup FormatAutogroup
--    autocmd!
--    autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.lua,*.py,*.java FormatWrite
--  augroup END
--]],
--  true
--)
