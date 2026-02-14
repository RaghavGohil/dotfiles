return {

    -- Mason (LSP/DAP/Linters/Formatters manager)
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason + LSP config
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "lua_ls" },
                automatic_installation = false,
            })
        end,
    },

    -- Core LSP setup
    {
        "neovim/nvim-lspconfig",
        dependencies = { "cmp-nvim-lsp" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- LSP keymaps
            local on_attach = function(_, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                local keymap = vim.keymap.set

                keymap("n", "K", vim.lsp.buf.hover, opts)
                keymap("n", "gd", vim.lsp.buf.definition, opts)
                keymap("n", "gD", vim.lsp.buf.declaration, opts)
                keymap("n", "gi", vim.lsp.buf.implementation, opts)
                keymap("n", "go", vim.lsp.buf.type_definition, opts)
                keymap("n", "gr", vim.lsp.buf.references, opts)
                keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
                keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                keymap("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)

                -- keymap("n", "[d", vim.diagnostic.goto_prev, opts)
                -- keymap("n", "]d", vim.diagnostic.goto_next, opts)
                keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
            end

            -- 🔹 PYRIGHT (Python)
            vim.lsp.config.pyright = {
                capabilities = capabilities,
                on_attach = on_attach,
                root_dir = vim.fs.root(0, {
                    "pyproject.toml",
                    "setup.py",
                    "setup.cfg",
                    "requirements.txt",
                    ".git",
                }),
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "workspace",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            }

            -- 🔹 LUA LS
            vim.lsp.config.lua_ls = {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                vim.fn.stdpath("config"),
                                vim.fn.stdpath("data") .. "/lazy",
                            },
                        },
                        telemetry = { enable = false },
                    },
                },
            }

            -- 🔹 ENABLE SERVERS
            vim.lsp.enable({ "pyright", "lua_ls" })
        end,
    },


    -- Autocompletion setup
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },
}
