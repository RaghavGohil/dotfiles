vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- for opening netrw.

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")  -- this and below lines are to move the lines up and down just like visual studio code!
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")                    -- normal mode but use this to collapse lines by keeping the cursor in the same position.

vim.keymap.set("n", "<C-d>", "<C-d>zz")              -- scrolls the page down by half.
vim.keymap.set("n", "<C-u>", "<C-u>zz")              -- the same as above but up.

vim.keymap.set("n", "n", "nzzzv")                    -- do search and then go there with the cursor in the middle.
vim.keymap.set("n", "N", "Nzzzv")                    -- does reverse search.

vim.keymap.set("n", "<leader>y", [["+Y]])            -- yank the current line to buffer.
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+y]])   -- yank the selection to buffer.

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])   -- delete and don't forget the last word yanked.

vim.keymap.set("n", "Q", "<nop>")                    --no operation.

-- For multiline block editing press C-Q and shift i

vim.keymap.set("n", "<leader>so", "<cmd>source<CR>") -- source file.

vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "gg0vG$")           -- yank the current line to buffer.

vim.keymap.set("n", "<leader>b", "<cmd>!!<CR")       -- run the last command.

vim.keymap.set("n", "<leader>vs", "<cmd>vs<CR><C-w>l")       -- vertical split.
vim.keymap.set("n", "<leader>hs", "<cmd>sp<CR><C-w>j")       -- horizontal split.

vim.keymap.set("n", "<leader>=", "<cmd>wincmd +<CR>", { silent = true }) -- increase height
vim.keymap.set("n", "<leader>-", "<cmd>wincmd -<CR>", { silent = true }) -- decrease height
vim.keymap.set("n", "<leader>,", "<cmd>wincmd ><CR>", { silent = true }) -- increase width
vim.keymap.set("n", "<leader>.", "<cmd>wincmd <<CR>", { silent = true }) -- decrease width

vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")       -- easy quit.
vim.keymap.set("n", "<leader>Q", "<cmd>q!<CR>")       -- easy quit ultra pro max.
