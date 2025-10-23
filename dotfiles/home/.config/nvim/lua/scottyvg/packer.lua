--This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "nvim-lua/plenary.nvim"

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
	  'folke/tokyonight.nvim',
	  as = 'tokyonight',
	  config = function()
		  vim.cmd('colorscheme tokyonight')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  use {
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use({'hrsh7th/cmp-path'}) -- path completion
  use({'hrsh7th/cmp-buffer'}) -- buffer completion

  use({'nvim-orgmode/orgmode', config = function()
            require('orgmode').setup{}
        end
    })

  use({ "folke/todo-comments.nvim",
	  requires = { {'nvim-lua/plenary.nvim'} }
  })

  -- TJ's recommended development plugins
  use({
    "williamboman/mason.nvim", -- LSP server manager
    "williamboman/mason-lspconfig.nvim", -- Mason + lspconfig integration
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- Auto-install tools
  })

  use({ "j-hui/fidget.nvim", tag = "legacy" }) -- LSP progress indicators

  use({
    "stevearc/conform.nvim", -- Better formatting
  })

  use({
    "stevearc/oil.nvim", -- Edit directories like buffers
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  use({
    "echasnovski/mini.nvim", -- Collection of useful mini plugins
  })

  -- EXPERIMENTAL
  use {
      'scottyvg/invisibilia-ai',
        requires = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
  },
  config = function()
    require('invisibilia-ai').setup({
      -- Your configuration here
    })
  end,
}

end)
