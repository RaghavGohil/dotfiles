return {

    ---------------------------------------------------------------------
    -- MASON
    ---------------------------------------------------------------------
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "lua_ls",
                    "clangd",
                    "ruff",
                },
                automatic_installation = false,
            })
        end,
    },

    ---------------------------------------------------------------------
    -- FORMATTER (Ruff via Conform)
    ---------------------------------------------------------------------
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "ruff_format" },
                    lua = { "stylua" },
                    c = { "clang_format" },
                    cpp = { "clang_format" },
                },

                format_on_save = function(bufnr)
                    if vim.bo[bufnr].filetype == "python" then
                        return { timeout_ms = 500 }
                    end
                end,
            })

            vim.keymap.set("n", "<leader>f", function()
                require("conform").format({ async = true })
            end, { desc = "Format buffer" })
        end,
    },

    ---------------------------------------------------------------------
    -- LSP (NEW API)
    ---------------------------------------------------------------------
    {
        "neovim/nvim-lspconfig",
        dependencies = { "cmp-nvim-lsp" },
        config = function()
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(client, bufnr)
                -- Disable formatting from LSPs
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false

                local map = vim.keymap.set
                local opts = { buffer = bufnr }

                map("n", "K", vim.lsp.buf.hover, opts)
                map("n", "gd", vim.lsp.buf.definition, opts)
                map("n", "gD", vim.lsp.buf.declaration, opts)
                map("n", "gi", vim.lsp.buf.implementation, opts)
                map("n", "gr", vim.lsp.buf.references, opts)
                map("n", "<leader>rn", vim.lsp.buf.rename, opts)
                map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                map("n", "<leader>e", vim.diagnostic.open_float, opts)
            end

            -- PYRIGHT (types only)
            vim.lsp.config.pyright = {
                capabilities = capabilities,
                on_attach = on_attach,
                root_dir = vim.fs.root(0, {
                    "pyproject.toml",
                    "setup.py",
                    "requirements.txt",
                    ".git",
                }),
            }

            -- RUFF (linting + fixes)
            vim.lsp.config.ruff = {
                capabilities = capabilities,
                on_attach = on_attach,
                init_options = {
                    settings = {
                        args = {},
                    },
                },
            }

            -- LUA
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

            -- C / C++
            vim.lsp.config.clangd = {
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                },
            }

            -- ENABLE SERVERS
            vim.lsp.enable({
                "pyright",
                "ruff",
                "lua_ls",
                "clangd",
            })
        end,
    },

    ---------------------------------------------------------------------
    -- AUTOCOMPLETION
    ---------------------------------------------------------------------
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
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end,
    },
}
