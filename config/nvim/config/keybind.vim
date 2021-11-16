
"██╗░░██╗███████╗██╗░░░██╗██████╗░██╗███╗░░██╗██████╗░░██████╗
"██║░██╔╝██╔════╝╚██╗░██╔╝██╔══██╗██║████╗░██║██╔══██╗██╔════╝
"█████═╝░█████╗░░░╚████╔╝░██████╦╝██║██╔██╗██║██║░░██║╚█████╗░
"██╔═██╗░██╔══╝░░░░╚██╔╝░░██╔══██╗██║██║╚████║██║░░██║░╚═══██╗
"██║░╚██╗███████╗░░░██║░░░██████╦╝██║██║░╚███║██████╔╝██████╔╝
"╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═════╝░╚═╝╚═╝░░╚══╝╚═════╝░╚═════╝░

let mapleader = ','
" Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-c> :tabclose<CR>

" Fast saving
nnoremap <C-s> :<C-u>w<CR>
vnoremap <C-s> :<C-u>w<CR>
cnoremap <C-s> <C-u>w<CR>

"|===============|
"|  B U F F E R  |
"|===============|

" Buffer Switching
nnoremap <silent>gt :bnext<CR> 
nnoremap <silent>gT :bprevious<CR>

" Create New Buffer
nnoremap <silent><leader>bn :enew<CR>

" Close Current Buffer
nnoremap <silent><leader>bq :bp <bar> bd! #<CR>

" Close All Buffer
nnoremap <silent><leader>bQ :bufdo bd! #<CR>

"|===================|
"|  T E R M I N A L  |
"|===================|

" Open Terminal on Vertical Split Mode
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

nnoremap <c-n> :call OpenTerminal()<CR>

"|==============|
"| P A N E L S  |
"|==============|

" Panel Switching
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Turn Terminal to normal mode with esc
tnoremap <Esc> <C-\><C-n>

"|=================|
"|  P L U G I N S  |
"|=================|

" NvimTree
nnoremap <silent><C-f> :NvimTreeToggle<CR>
