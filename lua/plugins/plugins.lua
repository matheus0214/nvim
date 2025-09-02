return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		config = function()
		    require('telescope').setup({
		        defaults = {
		            file_ignore_patterns = { "%.git/", "node_modules/" },
		        },
            })
		end
	},
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup {
                numhl = true,
                current_line_blame = true,
            }
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        dependencies = { "OXY2DEV/markview.nvim" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"markdown", "markdown_inline"}
            })
        end
    },
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = {
    --         'neovim/nvim-lspconfig',
    --         'hrsh7th/cmp-nvim-lsp',
    --         'hrsh7th/cmp-buffer',
    --         'hrsh7th/cmp-path',
    --         'hrsh7th/cmp-cmdline',
    --         'hrsh7th/nvim-cmp',
    --     },
    --     event = "InsertEnter",
    --     config = function()
    --         local cmp = require("cmp")
    --
    --         cmp.setup({
    --             completion = {
    --                 completeopt = "menu,menuone,noselect"
    --             },
    --             snippet = {
    --                 expand = function(_) end, -- não usamos snippets aqui
    --             },
    --             mapping = cmp.mapping.preset.insert({
    --                 ["<Tab>"] = cmp.mapping.select_next_item(),
    --                 ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    --                 ["<C-Space>"] = cmp.mapping.complete(),
    --                 ["<CR>"] = cmp.mapping.confirm({ select = true }),
    --             }),
    --             sources = cmp.config.sources({
    --                 { name = "path" },
    --                 { name = "buffer" },
    --                 { name = 'nvim_lsp' },
    --             }),
    --         })
    --     end,
    -- },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
        },
        lazy = false,
        config = function()
            require("neo-tree").setup({})
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {
              "lua_ls",
              "eslint",
              "ts_ls"
            }
          })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
          local lspconfig = require('lspconfig')

          lspconfig.lua_ls.setup ({})
          lspconfig.eslint.setup ({})
          lspconfig.ts_ls.setup ({})
        end
    },
    {
        "sainnhe/gruvbox-material",
        config = function()
            vim.cmd('colorscheme gruvbox-material')
        end
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    javascript = {
                        "eslint",
                        "biome",
                        stop_after_first = true
                    },
                    typescript = {
                        "eslint",
                        "biome",
                        stop_after_first = true
                    }
                }
            })
        end
    }
}
