"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc --configuration of vim
" Author: Jinxue Liu
" E-mail:
" Date: 2019/02/23
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" ============================== Basic settings ==============================

colorscheme molokai           " set the colorscheme to molokai
let g:molokai_original = 1
let g:rehash256 = 1

set lines=50                  " set the height of the vim window
set columns=180               " set the width of the vim window
set number                    " show line number
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
set cursorcolumn
set cursorline
filetype plugin indent on 
syntax on 

" auto completion
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>
inoremap { {<CR>}<ESC>kA<CR>

" ===========================================================================

" ============================= Auto Set Comment ============================

autocmd BufNewFile *.c,*.cc,*.cpp,*.h,*.hpp,*.py,*.sh exec ":call SetTitle()"

" add comment
func SetComment()
	call setline(1,"/*================================================================")
	call append(line("."),   "*   Copyright (C) ".strftime("%Y").". All rights reserved.")
	call append(line(".")+1, "*   ")
	call append(line(".")+2, "*   Name: ".expand("%:t"))
	call append(line(".")+3, "*   Author: Jinxue Liu")
	call append(line(".")+4, "*   Date: ".strftime("%Y/%m/%d"))
	call append(line(".")+5, "*   Description: ")
	call append(line(".")+6, "*")
	call append(line(".")+7, "================================================================*/")
	call append(line(".")+8, "")
	call append(line(".")+9, "")
endfunc
" add comment for shell & python
func SetComment_sh_py()
	call setline(4, "#================================================================")
	call setline(5, "#   Copyright (C) ".strftime("%Y").". All rights reserved.")
	call setline(6, "#   ")
	call setline(7, "#   Name: ".expand("%:t"))
	call setline(8, "#   Author: Jinxue Liu")
	call setline(9, "#   Date: ".strftime("%Y/%m/%d"))
	call setline(10, "#   Description: ")
	call setline(11, "#")
	call setline(12, "#================================================================")
	call setline(13, "")
	call setline(14, "")
endfunc

func SetTitle()
	if &filetype == 'python'
		call setline(1, "\#!/usr/bin/python ")
		call setline(2, "\#-*- coding=utf8 -*- ")
		call setline(3, "")
		call SetComment_sh_py()
	
	elseif &filetype == 'shell'
		call setline(1, "\#!/bin/sh")
		call setline(2, "")
		call setline(3, "")
		call SetComment_sh_py()

	else
		call SetComment()
	endif
endfunc
autocmd BufNewFile * normal G

" =====================================================================================
