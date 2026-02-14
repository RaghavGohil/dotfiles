return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")
      api.config.mappings.default_on_attach(bufnr)
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
    })

    -- Toggle file explorer
    vim.keymap.set(
      "n",
      "<leader>n",
      "<cmd>NvimTreeToggle<CR>",
      { noremap = true, silent = true, desc = "Explorer (nvim-tree)" }
    )
  end,
}

