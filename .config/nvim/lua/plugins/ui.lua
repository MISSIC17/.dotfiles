return {
  -- for the bottom line
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
  },
  --   for the Notifications UI
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  --  for the tabs
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    enabled = false,

    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   opts = {
  --     timeout = 5000,
  --     background_colour = "#000000",
  --     render = "wrapped-compact",
  --   },
  -- },

  -- buffer line
  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "kyazdani42/nvim-web-devicons",
  --   },
  --   opts = {
  --     options = {
  --
  --       show_buffer_close_icons = true,
  --       show_close_icon = true,
  --       hover = {
  --         enabled = true,
  --         deplay = 200,
  --         reveal = { "close" },
  --       },
  --       -- mode = "tabs",
  --     },
  --   },
  -- },

  -- filename
  -- {
  --   "b0o/incline.nvim",
  --   dependencies = {},
  --   event = "BufReadPre",
  --   priority = 1200,
  --   config = function()
  --     local helpers = require("incline.helpers")
  --     require("incline").setup({
  --       window = {
  --         padding = 0,
  --         margin = { horizontal = 0 },
  --       },
  --       render = function(props)
  --         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
  --         local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
  --         local modified = vim.bo[props.buf].modified
  --         local buffer = {
  --           ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
  --           " ",
  --           { filename, gui = modified and "bold,italic" or "bold" },
  --           " ",
  --           guibg = "#363944",
  --         }
  --         return buffer
  --       end,
  --     })
  --   end,
  -- },
  -- LazyGit integration with Telescope
  {
    "kdheepak/lazygit.nvim",
    keys = {
      dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
      },
      {
        ";c",
        ":LazyGit<Return>",
        silent = true,
        noremap = true,
      },
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- {
  --   "kristijanhusak/vim-dadbod-ui",
  --   dependencies = {
  --     { "tpope/vim-dadbod", lazy = true },
  --     { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  --   },
  --   cmd = {
  --     "DBUI",
  --     "DBUIToggle",
  --     "DBUIAddConnection",
  --     "DBUIFindBuffer",
  --   },
  --   init = function()
  --     -- Your DBUI configuration
  --     vim.g.db_ui_use_nerd_fonts = 1
  --   end,
  --   keys = {
  --     {
  --
  --       "<leader>d",
  --       "<cmd>NvimTreeClose<cr><cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>",
  --     },
  --   },
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    config = function()
      require("nvim-tree").setup({
        trash = {
          cmd = "gio trash",
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          local function opts(desc)
            return {
              desc = "nvim-tree: " .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true,
            }
          end

          -- default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- custom mappings
          vim.keymap.set("n", "t", api.node.open.tab, opts("Tab"))
        end,
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
          relativenumber = true,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
          custom = {
            "node_modules/.*",
          },
        },
        log = {
          enable = true,
          truncate = true,
          types = {
            diagnostics = true,
            git = true,
            profile = true,
            watcher = true,
          },
        },
      })

      if vim.fn.argc(-1) == 0 then
        vim.cmd("NvimTreeFocus")
      end
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    event = "VimEnter",
    enabled = true,
    opts = function()
      local logo = [[
.+++++++++++xxx+xxx++;;;;;;;;++x++;::;xxx+++++;;;;;;:.
.xxxxxxxxxxxxx++++;;+++++;+;++;;;+xxXXxx;........:..:.
.xxxxxxxxxxxxx++++++;;x+++++++++++;+;::+;:;xxxx+:..::.
.+++xxxxxx++xx+x+++++;+++++++++++++;+:;x+;;+;;+xx;&&&:
.+x++xxxxxxxxxxxxx++++;+;++++++;++++xx+xx+;;;;;+x.....
.xxxxxxx+xxxx++++;;;++++++;;;;;++++++x..;.;;;;;:......
.xxxxxxxxx;;;;++++xxxxxxx+++;++;;;;;+xX.Xxxxxxxx;.....
.xxxxxxx+;;++xxxx+;;;;;;;;xxxxxx++;;;;;+;;;;;;;;......
.xxxxxx+;;+xx++++;;;::::;:....::+xx;;;;;;;;;;;;;xxxxx.
.+xxx++;++x+;++++xx;:...........::xxxxx+x;:;;;;;;;;;;.
.+xxx+;;+++;;+x++;+:.::...::::.....xx+++xx+;;;;;;;;++.
.x+:+;;xx;;xxx+;;:::::::::::........+++++++xxx;;;+++;.
.++++;xxx+xxxxxxxx+.........;&&&&&&;Xxx;;;;;+xxx;;;;+.
.x++;++++xxxxxxx+xxX&&x...&&+........:x;;;++xxxx;;;;;.
.+x+++xx+xxxxx;.......x&$$x..:;:....x;x+;;+++++x;:;:;.
.x+;+xxx;+xxx;:;xxXx..xx..:.::;:.:xx+xx++;+;++xx;:.:;.
.xxx++xx;;x+xx;:....:xXx..:X+:...x$$x:x;++;+;+xx:.;+;.
.xxx;++++;+xxxxX$$$$+;xX:.:..;xxx;....x.:+++;+x+:;;;;.
.x++;+;+x++xxx;......Xx...............x;:+x+++;:;;;;;.
.x++xxx+x;+xxx+:::...:.+..$;..........:Xx+x;++:;;;;;;.
.x++xx+x+;++xxx;::....:;...:............:;++;+;;;;;+;.
.xxxx+++++;:.;x+::::::::..............xxxx;+;;;;;;;;;.
.xxx+++xxx+xxxxx;::::;;;;+;;;;;:......xx+::++;;;;;;;;.
.xx+++x+++++++x+;;:.:;+;;:::::.......:+;;;;;;;;;;;;;;.
.+++xxx++++++;;++;;:.....::..........;x;++;;+;;;;;;;;.
.+++xx+xxx+++++x++;+;:::::..:....:::.;x;;;;+;+;;;;;;;.
.+xxx+x++:;+xxx+++xxx;:........:;:..;;xx+;;;;;;;;;;;;.
.+x++x++xx+x+xx+;;;;+x+;++x++;+:.:+;;.:;xxxx;;;;;++;;.
    ]]

      logo = string.rep("\n", 3) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- week_header = {
          --   enable = true,
          -- },
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1001, -- this plugin needs to run before anything else
  --   opts = {
  --     rocks = { "magick" },
  --   },
  -- },
  -- {
  --   "3rd/image.nvim",
  --   dependencies = { "luarocks.nvim" },
  --   config = function()
  --     -- ...
  --   end,
  -- },
}
