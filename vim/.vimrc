set nocompatible

""""""""""""""""""""""""
""" Vundle Settings """
""""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-bufferline'

Plugin 'rhysd/vim-clang-format'
Plugin 'Chiel92/vim-autoformat'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'hashivim/vim-terraform'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'fishcakez/vim-dialyzer'
call vundle#end()

"""""""""""""""""""""""""
""" NERDTree Settings """
"""""""""""""""""""""""""
" Opens NERDTree by default
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree shortcut toogle
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""
""""" Misc Settings """""
"""""""""""""""""""""""""
" filetype identation activation
filetype plugin indent on

" syntax highlighting and colorsheme setting
syntax enable

" colorscheme config
colorscheme monoacc

" ativate line number
set number

" two space tab
set expandtab
set shiftwidth=2
set softtabstop=2

" show hidden files
"let NERDTreeShowHidden=1

" set path variable to the current directory
set path=$PWD/**

""""""""""""""""""""""""""""
""" vim-airline settings """
""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled=1 " extension tabline
set laststatus=2 " show status line

"""""""""""""""""""""""""""""""
""" vim-syntastic settings  """
"""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_asm_checkers = [''] "disables asm checker
let g:syntastic_cpp_include_dirs = ['']
let g:syntastic_c_include_dirs = ['/usr/local/Cellar/avr-gcc/7.2.0/avr/include/' ]

"""""""""""""""""""""""""""""""""
""" vim-clang-format settings """
"""""""""""""""""""""""""""""""""
let g:clang_format#code_style="Google"


"""""""""""""""""""""""""""""""""
""" vim-autoformat settings """
"""""""""""""""""""""""""""""""""
map <C-S-f> :Autoformat<CR>


"""""""""""""""""""""""""""""""""
""" vim-markdown settings """
"""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1


"""""""""""""""""""""""""""""""""
""" ctrlp settings """
"""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
