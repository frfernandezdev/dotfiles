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
    use "kyazdani42/nvim-web-devicons"
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = [[require("plugins.lualine")]]
    }

    -- Tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
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
    use {
      "hrsh7th/nvim-cmp",
      after = "nvim-lspconfig",
      config = [[require("plugins.cmp")]]
    }

    use {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      {
        "windwp/nvim-autopairs",
        config = [[require("plugins.autopairs")]]
      },
      requires = {"hrsh7th/nvim-cmp"}
    }

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      config = [[require("plugins.telescope")]],
      requires = {{"nvim-lua/plenary.nvim"}}
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      config = [[require("plugins.treesitter")]]
    }

    use {
      "nvim-treesitter/playground",
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
      requires = {
        "nvim-treesitter/nvim-treesitter"
      }
    }

    use {
      "mhartington/formatter.nvim",
      config = [[require("plugins.formatter")]],
    }

    use "nvim-lua/plenary.nvim"
    use {
      "lewis6991/gitsigns.nvim",
      config = [[require("plugins.gitsigns")]],
      requires = {
        "nvim-lua/plenary.nvim"
      },
    }
    use "tpope/vim-fugitive"


    if packer_bootstrap then
      require("packer").sync()
    end
  end
)
