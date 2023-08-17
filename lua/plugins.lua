local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  -- check it install_path is not exist, install it
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "nvim-lua/plenary.nvim"

  -- tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- lsp
  use {
    'neovim/nvim-lspconfig',    -- collection of configurations for built-in LSP client
    'hrsh7th/nvim-cmp',         -- autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- snippets source for nvim-cmp
    'L3MON4D3/LuaSnip',         -- snippets plugin
  }

  -- ui
  use {
    'nvim-lualine/lualine.nvim', -- lualine
    'akinsho/toggleterm.nvim',   -- bottom terminal
    "lukas-reineke/indent-blankline.nvim",
    { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' },
    'ellisonleao/gruvbox.nvim',
    'nvim-treesitter/nvim-treesitter'
  }

  -- tools
  use {
    'folke/which-key.nvim',   -- opens a popup with suggestions to complete a key binding
    'phaazon/hop.nvim',       -- easymotion
    'kylechui/nvim-surround', -- change pairs
    'windwp/nvim-autopairs',  -- auto close pairs
    'numToStr/Comment.nvim',  -- quick comment
  }

  -- search
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.2' }     -- search


  if packer_bootstrap then
    require('packer').sync()
  end
end)
