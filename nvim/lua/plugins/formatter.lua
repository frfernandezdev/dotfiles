local formatter = require("formatter")

formatter.setup(
  {
    filetype = {
      javascript = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
      },
      javascriptreact = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
      },
      typescript = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
      },
      typescriptreact = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
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
            exe = "java",
            args = {"-jar", "~/google-java-format.jar", "-"},
            stdin = true
          }
        end
      }
    }
  }
)

vim.api.nvim_exec(
  [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.lua,*.py,.java FormatWrite
  augroup END
]],
  true
)
