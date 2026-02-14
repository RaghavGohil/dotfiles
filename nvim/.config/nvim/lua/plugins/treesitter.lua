return
{
    "nvim-treesitter/nvim-treesitter",
    build = ":tsupdate",
    config = function ()
        require'nvim-treesitter.configs'.setup {
            -- a list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript" , "typescript", "go", "python" , "java" , "html" , "c_sharp" , "css" , "rust"},
            -- install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            -- automatically install missing parsers when entering buffer
            -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
            auto_install = true,
            ---- if you need to change the installation directory of the parsers (see -> advanced setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
            highlight = {
              enable = true,
              additional_vim_regex_highlighting = false,
            },
        }
    end
}

