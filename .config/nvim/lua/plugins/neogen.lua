return {
  "danymat/neogen",
  config = true,
  languages = {
    javascript = {
      template = {
        annotation_convention = "jsdoc",
      },
    },
    typescript = {
      template = {
        annotation_convention = "tsdoc",
      },
    },
  },
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
