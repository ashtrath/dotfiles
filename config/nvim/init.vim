
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
"|=========================|
"|  A U T O C O M M A N D  |
"|=========================|

" Ensure every files have highlighting
autocmd BufEnter * :syntax sync fromstart

" Auto insert mode & disable number on terminal 
augroup neo_terminal
  autocmd!
  autocmd TermOpen * startinsert
  autocmd TermOpen * :set nonumber
augroup END

" Disable cursorline in some mode
augroup no_cursorline
  autocmd!
  autocmd BufEnter,WinEnter,InsertLeave * set nocursorline
  autocmd BufLeave,WinLeave,InsertEnter * set cursorline
augroup END
