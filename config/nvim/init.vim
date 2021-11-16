
"███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
"████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
"██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
"██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
"██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
"╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝


"|=============================|
"|   I M P O R T A N T ! ! !   |
"|=============================|

source $HOME/.config/nvim/plugin/plugins.vim
source $HOME/.config/nvim/config/nvim-settings.vim
source $HOME/.config/nvim/config/keybind.vim

"|=========================|
"|  A U T O C O M M A N D  |
"|=========================|

" Ensure every files have highlighting
autocmd BufEnter * :syntax sync fromstart

" Auto insert mode & disable things on terminal 
augroup neo_terminal
  autocmd!
  autocmd TermOpen * startinsert
  autocmd TermOpen * :set nonumber
  autocmd TermOpen * :set laststatus=0
augroup END

" Disable cursorline in some mode
augroup no_cursorline
  autocmd!
  autocmd BufEnter,WinEnter,InsertLeave * set nocursorline
  autocmd BufLeave,WinLeave,InsertEnter * set cursorline
augroup END

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Autocomand to remember last editing position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
