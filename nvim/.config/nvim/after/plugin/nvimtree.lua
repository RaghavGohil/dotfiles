local nvimtree = require("nvim-tree")
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
nvimtree.setup()

-- OR setup with some options
nvimtree.setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>t", function()
    vim.cmd("NvimTreeToggle")
end)
