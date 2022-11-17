local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("~/dev/narrow")

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  }

  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  })

  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "sumneko_lua", "rust_analyzer" }
      })
    end
  })

  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("configs/lspconfig")
    end
  })


  use({
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_keymaps()
    end,
  })

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  })

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end
  }

  -- colorschemes

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
      require("catppuccin").setup()
      vim.api.nvim_command([[colorscheme catppuccin]])
    end
  }

  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
      require("nvim-tree").setup()
    end,
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup({
        options = { theme = "catppuccin" },
      })
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "rust", "norg" },
        highlight = {
          enable = true,
        },
      })
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("configs/telescope")
    end,
  })

  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end,
  })

  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("saadparwaiz1/cmp_luasnip")
  use("L3MON4D3/LuaSnip")

  use({
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
          ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "buffer" },
          { name = "path" },
        }),
      })
      -- `/` cmdline setup.
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  })

  use({
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("diffview").setup({})
    end
  })

  use({
    "TimUntersberger/neogit",
    requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    config = function()
      require("neogit").setup({
        integrations = {
          diffview = true
        }
      })
    end,
  })

  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("configs.octo")
    end,
  })

  if PackerBootstrap then
    require("packer").sync()
  end
end)
