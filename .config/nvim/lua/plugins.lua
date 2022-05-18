
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'kyazdani42/nvim-web-devicons'

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
    'feline-nvim/feline.nvim',  
    config = function()
      require('feline').setup() 
    end
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
