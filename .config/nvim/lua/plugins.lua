return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use 'heftyfunseeker/narrow'

  use {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps()
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end
  }

  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').load()
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require('nvim-tree').setup()
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = { theme = 'onedark' }
      }
    end
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('telescope').setup()
    end
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup()
    end
  }

  use {
    "williamboman/nvim-lsp-installer",
    config = function()
      require("nvim-lsp-installer").setup({
        automatic_installation = true,
        ui = {
          icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
          }
        }
      })
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('configs/lspconfig')
    end
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
          window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
          },
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'buffer' },
          { name = 'path' },
          { name = 'cmdline' },
        })
      })
    end
  }
end)
