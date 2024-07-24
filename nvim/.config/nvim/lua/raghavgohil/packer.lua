-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Useful plugins
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
	use('nvim-treesitter/nvim-treesitter' , { run = ':TSUpdate'})
	use('theprimeagen/harpoon')
	use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
	-- Theme
    use('rebelot/kanagawa.nvim')
    -- Undo Tree
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use('mbbill/undotree')
    use('github/copilot.vim')
    use('folke/trouble.nvim')
    -- File Tree
    use('nvim-tree/nvim-tree.lua')
    use('nvim-tree/nvim-web-devicons') --install a nerdfont
end)
