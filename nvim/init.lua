vim.cmd([[source ~/.vimrc]])

-- see: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- map leader must be set before loading plugins
vim.g.mapleader = " "

-- see: https://github.com/milanglacier/nvim/blob/master/lua/load_plugins.lua
-- see: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L81-L112
-- see: https://blog.codeminer42.com/configuring-language-server-protocol-in-neovim/

require("lazy").setup({
  { "farmergreg/vim-lastplace" },
  { "LnL7/vim-nix" },
  { "airblade/vim-gitgutter" },

  { 'neovim/nvim-lspconfig' },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
    },
  },
}, {
  install = {
    colorscheme = { "default" },
    background = "light",
  }
})

require("lsp-config")
require("lsp-completion")
