set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" These options force Vim to source .vimrc file if it is present in working
" directory, thus providing a place to store project-specific configuration.
set exrc
set secure

"Pathogen:
execute pathogen#infect()
syntax on
filetype plugin indent on

" Project-Specific Options:
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
"Keep lines 100 chars at most.
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray
set number
" Backspace through everything in insert mode."
set backspace=indent,eol,start 

" Filetype Detection:
augroup project
  autocmd!
  autocmd BufRead, BufNewFile *.h, *.c set filetype=c.doxygen
augroup END

"Setting Path Variable:
let &path.="src/include,/usr/include/AL,"

"YouCompleteMe – Ultimate Autocomplete Plugin for Vim:
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

"Project Drawer:

"Open NERDTree with Ctrl+n.
map <C-n> :NERDTreeToggle<CR>
"Close vim if the only window left open is a NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Configure Build System:
"set makeprg=make\ -C\ ../build\ -j9
"nnoremap <F4> :make!<cr>

"Configure Launch System:
"You can execute any shell command from Vim's command mode if you prepent it
"with !. For example: :!./my_great_program
"nnoremap <F5> :!./my_great_program<cr>

"Remove message 'press ENTER or type command to continue' on vim start.
set shortmess=a
set cmdheight=2
