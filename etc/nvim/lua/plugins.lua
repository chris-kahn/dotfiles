return require('packer').startup(function(use)
  -- Package management
  use 'wbthomason/packer.nvim'

  -- Allow reloading nvim config
  use 'famiu/nvim-reload'

  -- Tree-sitter parser (provides better colour schemes and more)
  use { 'kahnc/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- Configure Neovim's built-in language server.
  use 'neovim/nvim-lspconfig'
  use 'folke/lsp-trouble.nvim'
  -- use 'scalameta/nvim-metals'

  -- LSP-specific add-ons
  use 'glepnir/lspsaga.nvim'

  -- Auto-complete from LSP
  use 'hrsh7th/nvim-compe'

  -- Themes
  use 'folke/tokyonight.nvim'
  use 'sainnhe/gruvbox-material'
  use 'kahnc/nord.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  -- Highlight colour names with their actual colour
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

  -- File browser
  use 'preservim/nerdtree'

  use { 
      'terrortylor/nvim-comment',

      config = function()
        require('nvim_comment').setup()
      end
  }

  use 'LnL7/vim-nix'

  -- Linting highlights, etc
  -- use 'desmap/ale-sensible'
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex', 'typescript', 'typescriptreact', 'typescriptcommon', 'javascript', 'javascriptreact', 'scala', 'java', 'lua' },
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]',
  --   after = 'ale-sensible'
  -- }

  -- Allow reacting to macOS dark mode changes
  -- use 'cormacrelf/dark-notify'

  -- Hot key documentation
  use 'liuchengxu/vim-which-key'
  use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
  }

  -- Lua
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }

  -- Quick navigation, jump to char/line.
  use 'justinmk/vim-sneak'

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- vimwiki
  use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/src/wiki',
          syntax = 'markdown',
          ext = '.md',
        }
      }
    end
  }

  -- Vim git porcelain
  use 'tpope/vim-fugitive'
  use 'TimUntersberger/neogit'
  use 'rhysd/git-messenger.vim'

  -- Show uncommitted changes in the gutter, similar to vim-gitgutter
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }

  -- Tmux support
  use 'christoomey/vim-tmux-navigator'
  use 'tmux-plugins/vim-tmux-focus-events'

  -- Smooth scrolling
  -- use 'psliwka/vim-smoothie'

  -- Run tests, etc, in the background
  use 'tpope/vim-dispatch'

  -- Highlight blank lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua'
  }

  use {
    'kevinhwang91/rnvimr',
    config = function()
        vim.g.rnvimr_ex_enable = 1
        vim.g.rnvimr_draw_border = 1
        vim.g.rnvimr_pick_enable = 1
        vim.g.rnvimr_bw_enable = 1
        vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})
    end
  }
end)
