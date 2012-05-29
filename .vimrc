set nocompatible
set nowrap
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set shiftround
set showmatch
set ruler
set bg=dark
set hlsearch
set viminfo='20,\"500

syntax on
"SyntasticEnable
let g:syntastic_enable_signs=1
autocmd FileType h,c,cpp set tabstop=2 shiftwidth=2

filetype plugin on
filetype indent on
set modeline

autocmd FileType haskell set tabstop=8 shiftwidth=4 expandtab
"autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
autocmd FileType gitcommit let leave_my_cursor_position_alone = 1

" Make the cursor jump to the last position in a file.
autocmd BufReadPost *
			\ if ! exists("g:leave_my_cursor_position_alone") |
			\     if line("'\"") > 0 && line ("'\"") <= line("$") |
			\         exe "normal g'\"" |
			\     endif |
			\ endif
