-- return {
--   {
--     "craftzdog/solarized-osaka.nvim",
--     branch = "osaka",
--     lazy = true,
--     priority = 1000,
--     opts = function()
--       return {
--         transparent = false,
--       }
--     end,
--   },
--   {
--     "habamax/vim-pire",
--   },
--   { "rose-pine/neovim", name = "rose-pine" },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "osaka",
--     },
--   },
-- }

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      on_highlights = function(hl, c)
        hl.Comment = {
          fg = "#7aa2f7",
          italic = true,
        }
        hl.LineComment = {
          fg = "#7aa2f7",
          italic = true,
        }
        hl.LspInlayHint = {
          fg = "#5e77ac", -- bright green, or use "#7aa2f7" for bright blue
          bg = "NONE",
          italic = true,
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
}
