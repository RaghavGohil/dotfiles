vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv",vim.cmd.Ex) -- for opening netrw.

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- this and below lines are to move the lines up and down just like visual studio code!
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- normal mode but use this to collapse lines by keeping the cursor in the same position.

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- scrolls the page down by half.
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- the same as above but up.
vim.keymap.set("n", "n", "nzzzv") -- do search and then go there with the cursor in the middle.
vim.keymap.set("n", "N", "Nzzzv") -- does reverse search.

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", [["+Y]]) -- yank the current line to buffer.
vim.keymap.set({"n", "v"}, "<leader>Y", [["+y]]) -- yank the selection to buffer.

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete and don't forget the last word yanked.

vim.keymap.set("i", "<C-c>", "<Esc>") --nah this is real good from the primeagen.

vim.keymap.set("n", "Q", "<nop>") --no operation.
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- lsp format.

-- For multiline block editing press C-Q and shift i

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") -- move through the quickfix list.
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- powerful search

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end) -- source file.
vim.keymap.set("n", "<leader>sy", function() vim.cmd("so") vim.cmd("PackerSync") end) -- source file and packer sync.

--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
