local npairs = require("nvim-autopairs")

npairs.setup(
  {
    enable_check_bracket_line = false,
    fast_wrap = {
      map = "<M-e>",
      chars = {"{", "[", "(", '"', "'"},
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "Search",
      highlight_grey = "Comment"
    }
  }
)
