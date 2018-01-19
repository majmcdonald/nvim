" General
    set backup " make backup files
    set noerrorbells " don't make noise
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif  "jump to last place in file 
    set wildmenu " turn on command line completion wild style
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these list file extensions
    set wildmode=list:longest " turn on wild mode huge list
    set tags=tags; "single tags file for a source tree
    set backupdir=~/.vim/backup " where to put backup files
    set directory=~/.vim/temp " directory to place swap files in

" UI
    set ignorecase " case insensitive search
    set incsearch " BUT do highlight as you type you search phrase
    set smartcase " case insensitive by default
    set infercase " case inferred by default
    set lazyredraw " do not redraw while running macros
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set report=0 " tell us when anything is changed via :...
    set sidescrolloff=10 " Keep 5 lines at the size


" Text Formatting
    set expandtab " no real tabs please!
    set wrap " do not wrap line
    set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=8 " real tabs should be 8, and they will show with set list on
    set foldenable " Turn on folding
    set foldlevel=100 " Don't autofold anything (but I can still fold manually)

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.config/nvim/plugins')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'elzr/vim-json'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'roxma/nvim-completion-manager'
Plugin 'w0rp/ale'
Plugin 'majutsushi/tagbar'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plugin 'xolox/vim-misc'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'scrooloose/nerdtree'
call vundle#end()            " required
filetype plugin indent on    " required

" Nerdtree
nmap <silent> <F7> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1     " close after opening a file

" vim-buffergator
nmap <silent> <F3> :BuffergatorToggle<CR>

"vim-json
let g:vim_json_syntax_conceal = 0

" nvim-completion-manager settings
" don't give |ins-completion-menu| messages.  For example,
"'-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set shortmess+=c

"tagbar"
let g:tagbar_width = 30
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1
nmap <silent> <F4> :TagbarToggle<CR>

" airline 
" let g:airline#extensions#tabline#enabled = 1

" ale
let g:ale_sign_column_always = 1


" colorscheme
colorscheme adam

".jsbeautify
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


" Key Mappings
map K <c-u>
" K =  pageUp
"map J <c-d>
" J =  pageDown
nnoremap <silent> <Space>S :Sscratch<CR>
" open scratch
map + <c-w>+
map - <c-w>-
"use +/- to resize horizontal split
set pastetoggle=<F10>
" Open a new horizontal split
nnoremap <silent> <Space>s :sp<CR>
" Open a new horizontal split
nnoremap <silent> <Space>n :new<CR>
" " Open a new vertical split
nnoremap <silent> <Space>v :vs<CR>
" " close other open windows
nnoremap <silent> <Space>o <C-W>o
" " Move around between splits
nnoremap <Space>h <C-W>h
nnoremap <Space>l <C-W>l
nnoremap <Space>j <C-W>j
nnoremap <Space>k <C-W>k
"make split bigger
map - <c-w>-
" toggle numbers
nmap <silent> <F2> :set number!<CR>

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR><Paste>
