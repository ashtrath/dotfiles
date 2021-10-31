
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
nnoremap <C-[> :tabprevious<CR>
nnoremap <C-]> :tabnext<CR>

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

"|=================|
"|  P L U G I N S  |
"|=================|

" NvimTree
nnoremap <silent><C-f> :NvimTreeToggle<CR>
