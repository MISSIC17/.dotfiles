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
        -- Unused variables highlighting
        hl.DiagnosticUnnecessary = {
          fg = "#546b9a", -- dimmed foreground
          bg = "NONE",
          italic = true,
          underline = false,
          sp = "#f7768e", -- red underline color
        }
        -- Alternative: if you want strikethrough effect
        hl.DiagnosticDeprecated = {
          fg = "#565f89",
          bg = "NONE",
          strikethrough = true,
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
