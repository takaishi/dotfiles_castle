if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/r_takaishi/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/r_takaishi/.dein')
  call dein#begin('/home/r_takaishi/.dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/r_takaishi/.dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:


  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

syntax enable
