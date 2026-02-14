return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",  -- load when entering insert mode
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,      -- Treesitter integration (avoid pairing in comments/strings)
      enable_check_bracket_line = false,
      fast_wrap = {},
    })
    -- Integrate with nvim-cmp
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
}

