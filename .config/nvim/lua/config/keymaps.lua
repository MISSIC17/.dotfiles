local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set("n", "<leader>sx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" })

keymap.set("n", "x", '"_x')
-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
-- vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
-- vim.keymap.set("n", "<Leader>do", require("neogen").resume)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- File explorer with NvimTree
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)
-- keymap.set("t", "jk", [[<C-\><C-n>]])

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- File explorer with NvimTree
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)
keymap.set("n", "H", ":BufferLineCyclePrev<CR>", opts)
keymap.set("n", "L", ":BufferLineCycleNext<CR>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
-- keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "<c-\\>", ":vsplit<Return>", opts) -- vertical split
keymap.set("n", "<c-,>", ":split<Return>", opts) -- horizontal split

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

--Diagnostic
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

--spider
keymap.set({ "n", "o", "x" }, "B", function()
  require("spider").motion("b")
end, { desc = "Delete previous subword using Spider.nvim" })
