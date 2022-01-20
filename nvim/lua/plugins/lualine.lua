local lualine = require("lualine")

return lualine.setup(
  {
    options = {
      theme = "tokyodark"
    },
    extensions = {
      "nvim-tree"
    }
  }
)
