return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope", -- lazy-load on :Telescope 
    keys = {
        {
            "<leader><leader>",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files"
        },
        {
            "<leader>gr",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
            desc = "Grep string"
        },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup(
            {
                defaults = {
                    mappings = {
                        i = { ["<esc>"] = require("telescope.actions").close, -- exit insert mode quickly }, 
                    },
                },
            },
        })
    end,
}
