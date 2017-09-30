"タブやらハイライトやらの設定{{{
set backspace=indent,eol,start
noremap!  <BS>
noremap!  <DEL>
set tabstop=2
set shiftwidth=2
set number
set expandtab
set smarttab
set smartindent
set hlsearch
set wildmode=list:longest,full
set incsearch
set fileencodings+=cp932
set scrolloff=999
set termguicolors

augroup editvimrc
	autocmd!
  autocmd FileType vim set foldmethod=marker
augroup END

"}}}

if &compatible
  set nocompatible
endif

"require install dein.vim: 
" $ mkdir $HOME/.vim/dein/repos/github.com/Shougo
" $ git clone https://github.com/Shougo/dein.vim.git $HOME/.vim/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.vim/dein/')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let g:rc_dir    = expand("~/.config/nvim/")
  let s:python_toml      = g:rc_dir . '/python_dein.toml'
  let s:python_lazy_toml = g:rc_dir . '/python_dein_lazy.toml'
  let s:golang_toml      = g:rc_dir . '/golang_dein.toml'

  " TOML を読み込み、キャッシュしておく
  if filereadable(s:python_toml)
    call dein#load_toml(s:python_toml,      {'lazy': 0})
  endif
  if filereadable(s:python_lazy_toml)
    call dein#load_toml(s:python_lazy_toml, {'lazy': 1})
  endif
  if filereadable(s:golang_toml)
    call dein#load_toml(s:golang_toml,      {'lazy': 0})
  endif

" Let dein manage dein
  call dein#add('Shougo/dein.vim')


  call dein#end()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

colorscheme jellybeans

let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1

"my-keymap
"
"{{{

noremap <Space>ss : <C-u>source $HOME/.config/nvim/init.vim<CR>
nmap <Esc><Esc> :nohlsearch<cr>
nmap <C-c> <Esc>
"noremap <cr> o<Esc>
inoremap <F2> <M-i>
inoremap <F3> \\
nnoremap <F9> :<C-u>SCCompile<CR>
nnoremap <F8> :<C-u>SCCompileRun<CR>
noremap <F2> :<C-u>Dbg gdb
nnoremap tt :<C-u>tabnew<CR>
nnoremap tf :<C-u>tabnew
nnoremap <C-n> gt
nnoremap <C-p> gT
inoremap <c-a> <cr>
inoremap jj <esc>
nnoremap <s-tab> <<
inoremap <s-tab> <c-d>
tnoremap <silent><Esc> <C-\><C-n>


"inoremap <C-j> <down>
"inoremap <C-k> <up>
"inoremap <C-l> <right>
"inoremap <C-h> <left>
"}}}

augroup python
  autocmd!
"  let s:autopep8 = expand(g:rc_dir . )
  autocmd FileType python execute ":source " . expand(g:rc_dir . 'autopep8.vim')
augroup END


