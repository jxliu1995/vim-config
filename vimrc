
" ============================================================================================ "
"   
"   Name: .vimrc
"   Author: Jinxue Liu
"   Date: 2019/03/02
"   Description: vim configuration 
"
" ============================================================================================ "


" ====================================== Vundle ============================================== "

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Begin my own plugins
Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'vim-syntastic/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'tpope/vim-surround'
"Plugin 'majutsushi/tagbar'
" End my own plugins

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ============================================================================================ "

" =================================== Basic settings ========================================= "

set nobackup                  " Do not backup
set autowrite                 " Autowrite file  
filetype plugin indent on 

" size, colorscheme, syntax & Highlighting 
set lines=40                  " set the height of the vim window
set columns=160               " set the width of the vim window
set colorcolumn=81            " Highlighting 81th column
set number                    " show line number
set background=dark
if $COLORTERM == 'truecolor'
    set termguicolors
	colorscheme solarized-terminal
else
    set term=xterm
    set t_Co=256
    colorscheme solarized
endif
set cursorcolumn              " Highlighting column 
set cursorline                " Highlighting line
set ruler                     " Display cursor position status bar 
set hlsearch                  " Highlighting search 
set ignorecase                " Ignore case when search 
syntax enable 
syntax on 

" tab settings 
set tabstop=4                 " Number of spaces that a <Tab> in file counts for
set shiftwidth=4              " Number of spaces to use for each step of (auto)indent
set noexpandtab               " Do not expand a <Tab> as spaces
set backspace=2               " Number of spaces that a <Back> in file counts for
set autoindent
set smartindent
set cindent
if has("autocmd")
	autocmd BufRead,BufNewFile *.c,*.cc,*.cpp,*.h,*.py set expandtab
endif

" coding
set encoding=utf-8

" auto completion
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
inoremap { {<CR>}<ESC>kA<CR>

" ============================================================================================ "

" ================================== Auto Set Header ========================================= "

" add header for c
function HeaderC()
	call setline(1, "/*================================================================")
	call setline(2, "*")
	call setline(3, "*   Name: ".expand("%:t"))
	call setline(4, "*   Author: Jinxue Liu")
	call setline(5, "*   Date: ".strftime("%Y/%m/%d"))
	call setline(6, "*   Description: ")
	call setline(7, "*")
	call setline(8, "================================================================*/")
	call setline(9, "")
	call setline(10, "")
	call setline(11, "#include <stdio.h>")
	normal G
endfunction 
autocmd BufNewFile *.c,*.h exec ":call HeaderC()"

" add header for c++
function HeaderCPP()
	call setline(1, "/*================================================================")
	call setline(2, "*")
	call setline(3, "*   Name: ".expand("%:t"))
	call setline(4, "*   Author: Jinxue Liu")
	call setline(5, "*   Date: ".strftime("%Y/%m/%d"))
	call setline(6, "*   Description: ")
	call setline(7, "*")
	call setline(8, "================================================================*/")
	call setline(9, "")
	call setline(10, "")
	call setline(11, "#include <iostream>")
	call setline(12, "using namespace std;")
	normal G
endfunction 
autocmd BufNewFile *.cpp,*.cc,*.cxx,*.h,*.hpp exec ":call HeaderCPP()"

" add header for python
function HeaderPY()
	call setline(1, "\#!/usr/bin/python ")
	call setline(2, "\#-*- coding=utf8 -*- ")
	call setline(3, "")
	call setline(4, "#================================================================")
	call setline(5, "#   ")
	call setline(6, "#   Name: ".expand("%:t"))
	call setline(7, "#   Author: Jinxue Liu")
	call setline(8, "#   Date: ".strftime("%Y/%m/%d"))
	call setline(9, "#   Description: ")
	call setline(10, "#")
	call setline(11, "#================================================================")
	call setline(12, "")
	call setline(13, "")
	normal G
endfunction 
autocmd BufNewFile *.py exec ":call HeaderPY()"

" add header for shell 
function HeaderSH()
	call setline(1, "\#!/bin/sh")
	call setline(2, "")
	call setline(3, "")
	call setline(4, "#================================================================")
	call setline(5, "#   ")
	call setline(6, "#   Name: ".expand("%:t"))
	call setline(7, "#   Author: Jinxue Liu")
	call setline(8, "#   Date: ".strftime("%Y/%m/%d"))
	call setline(9, "#   Description: ")
	call setline(10, "#")
	call setline(11, "#================================================================")
	call setline(12, "")
	call setline(13, "")
	normal G
endfunction 
autocmd BufNewFile *.sh exec ":call HeaderSH()"
	
" ============================================================================================ "

" ==================================== YouCompleteMe Settings ================================ " 

" Set path of the config file
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" Do not ask about loading certain .ycm_extral_conf.py files
let g:ycm_confirm_extral_conf=0
" Set the number of characters the user needs to type before completion suggestions are trigged 
let g:ycm_min_num_of_chars_for_completion=2
" Turn off the omnicompletion engines
let g:ycm_cache_omnifunc=0
" Turn on semantic completion 
let g:ycm_seed_identifiers_with_syntax=1
" Do not collect identifiers from strings and comments
let g:ycm_collect_identifiers_from_comments_and_strings=0
" Turn on completion in comment and string 
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" Shield ycm in following file types
let g:ycm_filetype_blacklist = {
      \ 'text' : 1,
	  \ 'markdown' : 1,
	  \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}

" =========================================================================================== "

" =================================== NerdTree Setting ====================================== "

"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ 'Ignored'   : '☒',
"    \ "Unknown"   : "?"
"    \ }

" =========================================================================================== "

" ===================================== Syntastic =========================================== "

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" =========================================================================================== "


" =================================== C++ highlighting ====================================== "

let g:cpp_class_scope_highlight = 1                    " Enable highlighting of class scope 
let g:cpp_member_variable_highlight = 1                " Enable highlighting of member variables 
let g:cpp_class_decl_highlight = 1                     " Enable highlighting of class names in declarations 
let g:cpp_concepts_highlight = 1                       " Highlight the keywords concepts 
let g:cpp_no_function_highlight = 1                    " Enable highlighting of user defined functons

" =========================================================================================== "

" =========================================================================================== "

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" =========================================================================================== "
