return {
  -- {
  --
  --   "numToStr/Comment.nvim",
  --   opts = {},
  --   lazy = false,
  -- },
  {

    -- for commnents
    "danymat/neogen",
    config = true,
    languages = {
      javascript = {
        template = {
          annotation_convention = "jsdoc",
        },
      },

      javascriptreactt = {
        template = {
          annotation_convention = "jsdoc",
        },
      },
      typescript = {
        template = {
          annotation_convention = "tsdoc",
        },
      },

      typescriptreact = {
        template = {
          annotation_convention = "tsdoc",
        },
      },
    },
  },
}
