return {
  -- Mason setup
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "black",
        "debugpy",
        "phpactor",
      },
      -- Use the default installation directory
      install_root_dir = vim.fn.stdpath("data") .. "/mason",
    },
    config = function(_, opts)
      require("mason").setup(opts)

      -- Ensure debugpy is installed
      local mr = require("mason-registry")
      if not mr.is_installed("debugpy") then
        vim.cmd("MasonInstall debugpy")
      end
    end,
  },

  -- Mason LSP config setup
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "pyright",
        "phpactor",
      },
      automatic_installation = true,
    },
  },

  -- Configure LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        phpactor = {
          -- PHP language server
          init_options = {
            ["language_server_phpstan.enabled"] = true,
            ["language_server_psalm.enabled"] = true,
          },
        },
      },
    },
  },
}
