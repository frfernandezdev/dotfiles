local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Theme tokyonight
    use {
      "tiagovla/tokyodark.nvim",
      config = [[require("plugins.tokyodark")]]
    }

    -- Lualine
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true},
      config = [[require("plugins.lualine")]]
    }

    -- Tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons" -- optional, for file icon
      },
      config = [[require("plugins.tree")]]
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      {
        "williamboman/nvim-lsp-installer",
        after = "nvim-lspconfig",
        config = [[require("plugins.lsp")]]
      }
    }

    -- Cmp
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"L3MON4D3/LuaSnip"}
    use {
      "hrsh7th/nvim-cmp",
      after = "nvim-lspconfig",
      config = [[require("plugins.cmp")]]
    }
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"hrsh7th/cmp-cmdline", after = "nvim-cmp"}
    use {"saadparwaiz1/cmp_luasnip", after = "nvim-cmp"}
    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      config = [[require("plugins.telescope")]],
      requires = {{"nvim-lua/plenary.nvim"}}
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
      run = ":TSUpdate",
      config = [[require("plugins.treesitter")]]
    }

    use {
      "windwp/nvim-autopairs",
      config = [[require("plugins.autopairs")]]
    }

    use "windwp/nvim-ts-autotag"

    use {
      "mhartington/formatter.nvim",
      config = [[require("plugins.formatter")]]
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("gitsigns").setup()
      end
    }

    use {
      "kosayoda/nvim-lightbulb",
      config = function()
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
      end
    }

    use "tpope/vim-fugitive"

    if packer_bootstrap then
      require("packer").sync()
    end
  end
)
