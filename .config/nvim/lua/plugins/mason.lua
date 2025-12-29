return {
 "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = { "ts_ls" },
    })
    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
    })
  end,
}
