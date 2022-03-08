-- table of Packer Blocks
return {
   {
      "editorconfig/editorconfig-vim",
   },
   {
      "stefandtw/quickfix-reflector.vim",
   },
   {
      "AndrewRadev/splitjoin.vim"
   },
   {
      "ggandor/lightspeed.nvim"
   },
   {
      "tpope/vim-surround"
   },
   {
      'heftyfunseeker/narrow'
   },
   {
      'j-hui/fidget.nvim',
      config = function()
         require('fidget').setup({})
      end
   },
   {
      'TimUntersberger/neogit',
      requires = 'nvim-lua/plenary.nvim',
   },
}
