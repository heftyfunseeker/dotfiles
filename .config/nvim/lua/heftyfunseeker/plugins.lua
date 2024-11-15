-- Check if lazy.nvim is installed, and if not, install it
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Core Plugins
  { "nvim-lua/plenary.nvim" },
  { "kyazdani42/nvim-web-devicons" },
  { "nvim-neotest/nvim-nio" },
  { "heftyfunseeker/narrow" },

  -- Debugging Plugins
  { "mfussenegger/nvim-dap" },
  { "theHamsta/nvim-dap-virtual-text" },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require("dap")

      local codelldb_path = table.concat({ vim.fn.stdpath("data"), "mason", "bin", "codelldb" }, "/")
      dap.adapters.lldb = {
        type = 'server',
        port = "13000",
        executable = {
          command = codelldb_path,
          args = { "--port", "13000" },
        }
      }
      dap.configurations.rust = {
        {
          name = 'Launch',
          type = 'lldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
              'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
          runInTerminal = false,
        }
      }

      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()
    end
  },

  -- Surround Plugin
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Keybinding Plugin
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  },

  -- Mason Plugin
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },
    config = function()
      require("heftyfunseeker.configs.lspconfig")
    end,
  },

  -- Navigation Plugins
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_keymaps()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  },

  -- Trouble Plugin
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>gr",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha"
      require("heftyfunseeker.configs.catppuccin")
      vim.api.nvim_command([[colorscheme catppuccin]])
    end,
  },

  -- Git Signs Plugin
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- File Explorer
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        git = {
          ignore = false
        }
      })
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "catppuccin" },
      })
    end,
  },

  -- Treesitter Configuration
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Treesitter setup with selected languages
      require("nvim-treesitter.configs").setup({
        -- Specify the languages you want to include
        ensure_installed = {
          "c", "cpp", "rust", "javascript", "typescript", "lua",
          "json", "html", "css", "ruby", "bash", "markdown"
        },
        highlight = {
          enable = true, -- enable highlighting for the specified languages
        },
      })
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("heftyfunseeker.configs.telescope")
    end,
  },

  -- Terminal Plugin
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({})
    end,
  },

  -- Completion Plugins
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        completion = {
          keyword_length = 1
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
      -- `/` cmdline setup
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for `:`
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  },

  -- Git Integration Plugins
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require("diffview").setup({})
    end,
  },
  {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    config = function()
      require("neogit").setup({})
    end,
  },

  -- Navic Plugin
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require("nvim-navic").setup({
        icons = {
          File = ' ',
          Module = ' ',
          Namespace = ' ',
          Package = ' ',
          Class = ' ',
          Method = ' ',
          Property = ' ',
          Field = ' ',
          Constructor = ' ',
          Enum = ' ',
          Interface = ' ',
          Function = ' ',
          Variable = ' ',
          Constant = ' ',
          String = ' ',
          Number = ' ',
          Boolean = ' ',
          Array = ' ',
          Object = ' ',
          Key = ' ',
          Null = ' ',
          EnumMember = ' ',
          Struct = ' ',
          Event = ' ',
          Operator = ' ',
          TypeParameter = ' '
        }
      })
    end,
  }
}, {
  defaults = { lazy = false },
  checker = { enabled = true }, -- automatically check for plugin updates
})
