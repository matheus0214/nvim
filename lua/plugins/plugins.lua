return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local telescope = require('telescope')
      local open_with_trouble = require('trouble.sources.telescope').open

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "%.git/", "node_modules/" },
          mappings = {
            i = { ["<c-t>"] = open_with_trouble }, -- Ctrl+T em modo de inserção envia para o Trouble
            n = { ["t"] = open_with_trouble },     -- 't' em modo normal envia para o Trouble
          },
        },
      })

      telescope.load_extension("fzf")
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
      -- "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true, -- Set to true to show hidden files
            hide_dotfiles = false,
          },
        },
      })
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
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls"
        }
      })
    end
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {},
    config = function()
      require("tiny-inline-diagnostic").setup({
        options = {
          multilines = {
            enabled = true,
          },
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      vim.diagnostic.config({ virtual_text = false })

      local lua_cfg = vim.lsp.config.lua_ls
      local ts_cfg = vim.lsp.config.ts_ls

      if lua_cfg then
        vim.lsp.config('lua_ls', lua_cfg)
        vim.lsp.enable('lua_ls')
      end

      if ts_cfg then
        vim.lsp.config('ts_ls', ts_cfg)
        vim.lsp.enable('ts_ls')
      end
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
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- require('onedark').setup {
      --   style = 'warmer'
      -- }
      -- require('onedark').load()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
      })
    end
  },
  {
    "https://gitlab.com/motaz-shokry/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme gruvbox")
    end
  },
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      -- Only one of these is needed.
      "sindrets/diffview.nvim",   -- optional
      "esmuellert/codediff.nvim", -- optional

      -- For a custom log pager
      "m00qek/baleia.nvim", -- optional

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "nvim-mini/mini.pick",           -- optional
      "folke/snacks.nvim",             -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
    }
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd([[ colorscheme catppuccin-frappe]])
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ícones bonitos para os erros
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Trouble: Diagnósticos do Projeto (Workspace)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Trouble: Diagnósticos do Arquivo Atual (Buffer)",
      },
      {
        "<leader>xq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Trouble: Lista Quickfix",
      },
    },
    opts = {
      -- Você pode deixar vazio para usar os padrões da v3 que são excelentes,
      -- ou customizar o comportamento aqui dentro se desejar.
    },
  },
  {
    "aronjohanns/smooth-resize.nvim"
  }
}
