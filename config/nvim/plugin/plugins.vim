
"██████╗░██╗░░░░░██╗░░░██╗░██████╗░██╗███╗░░██╗░██████╗
"██╔══██╗██║░░░░░██║░░░██║██╔════╝░██║████╗░██║██╔════╝
"██████╔╝██║░░░░░██║░░░██║██║░░██╗░██║██╔██╗██║╚█████╗░
"██╔═══╝░██║░░░░░██║░░░██║██║░░╚██╗██║██║╚████║░╚═══██╗
"██║░░░░░███████╗╚██████╔╝╚██████╔╝██║██║░╚███║██████╔╝
"╚═╝░░░░░╚══════╝░╚═════╝░░╚═════╝░╚═╝╚═╝░░╚══╝╚═════╝░

call plug#begin('~/.local/share/nvim/site/autoload')

  " UI
  Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'akinsho/bufferline.nvim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'junegunn/goyo.vim'

  " Icons & Themes
  Plug 'shaunsingh/nord.nvim'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'xiyaowong/nvim-transparent'

  " Formatting & Linting
  Plug 'neovim/nvim-lspconfig'
  Plug 'onsails/lspkind-nvim'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'sbdchd/neoformat'

  " Completion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " Highlights
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'norcalli/nvim-colorizer.lua'
  
  " Search
  Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/plenary.nvim'

  " Markdown Preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

  " Other
  Plug 'numToStr/Comment.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'andweeb/presence.nvim' " Discord Rich Presence

call plug#end()

" Load all lua (plugins) file inside config folder
for plugin in split(glob('%/config/*.lua'), '\n')
    exe 'source' plugin
endfor

