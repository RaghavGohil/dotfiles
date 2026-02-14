return {
  "kylechui/nvim-surround",
  version = "*", -- Use latest stable
  config = function()
    require("nvim-surround").setup({
      -- You can customize keymaps here or leave default
      -- Default is: `ys` (add), `ds` (delete), `cs` (change)
    })
  end,
}
