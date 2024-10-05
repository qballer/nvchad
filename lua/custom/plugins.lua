local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "mypy",
        "ruff"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      -- require "custom.configs.lspconfig"
    end,
  },
  'nvim-lua/plenary.nvim',
  'nvim-pack/nvim-spectre',
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
      return "custom.configs.null-ls"
    end,
  }

}

return plugins
