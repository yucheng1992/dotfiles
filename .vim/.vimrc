"""
" vundle settings
"""
set nocompatible               " be iMproved
filetype off                   " required!
set viminfo+=n~/.nvim/tmpfiles/viminfo
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tomasr/molokai'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'Raimondi/delimitMate'

"snipmate.vim
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle 'garbas/vim-snipmate'
Bundle 'editorconfig/editorconfig-vim'

Bundle 'ervandew/supertab'
Bundle 'xuhdev/SingleCompile'
Bundle 'Rip-Rip/clang_complete'

Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/google.vim'
Bundle 'drmikehenry/vim-headerguard'
Bundle 'derekwyatt/vim-scala'

Bundle 'vim-scripts/Python-Syntax-Folding'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/a.vim'
Bundle "lepture/vim-jinja"
Bundle 'pangloss/vim-javascript'
" Bundle 'vim-scripts/Auto-Pairs'
Bundle 'majutsushi/tagbar'
Bundle 'fatih/vim-go'
Bundle 'nvie/vim-flake8'
Bundle 'luochen1990/rainbow'


" NERDTree
Bundle 'scrooloose/nerdtree'

"T-Comment
Bundle 'tomtom/tcomment_vim'
"syntastic
" Bundle 'scrooloose/syntastic'
" Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on     " required!

"""
" common
"""
set encoding=utf8
set langmenu=zh_CN.UTF-8
set imcmdline
set nocp	"no compatible
syntax enable
set backspace=indent,eol,start
set wildmode=longest:full
set wildmenu
set ruler	"ruler
set number
set wrap
set autoindent
set smartindent
set nocindent
set ts=2 sw=2 noet
set smarttab
set expandtab
set showmode
set showcmd
set showmatch
set hlsearch	
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
set ignorecase
set smartcase
set incsearch
set autochdir
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936
set viminfo='10,\"100,:20,%,n~/.viminfo'
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"au BufWritePost .vimrc so ~/.vimrc
set guifont=Monaco\ 8
set mouse=a
set autoread
set cursorline
set cursorcolumn  
set foldmethod=syntax
set foldlevel=100
set foldcolumn=2
set colorcolumn=100
set cinoptions+=g1,h2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal smartindent ts=2 sw=2
autocmd FileType html setlocal sw=2 ts=2
autocmd FileType jinja setlocal sw=2 ts=2
autocmd FileType java setlocal shiftwidth=4 tabstop=4 

inoremap {<CR> {<CR>}<Esc>ko

"""
" colorscheme
colorscheme molokai 
set background=dark
let g:molokai_original = 1
set t_Co=256
let g:Powerline_symbols = 'fancy'

let g:rainbow_active = 1

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"""
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
"""
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"""
" FUNCTION Full Tabpage full Path
"""
function! TabpageName(mode) 
  if     a:mode == 1 
      return fnamemodify(expand("%"), ":p:h") 
  elseif a:mode == 2 
      let name = fnamemodify(expand("%"), ":p:t") 
      if name == "" 
          return "(Untitled)" 
      endif 
      return name 
  endif 
endfunction 
function! TabpageState() 
  if &modified != 0 
      return '*' 
  else 
      return '' 
  endif 
endfunction 
set guitablabel=%{TabpageName(1)}/%{TabpageName(2)}%{TabpageState()} "1:Full Path, 2:File Name

"""
" automatically open and close the popup menu / preview window
"""
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"tmux color setting
if exists('$TMUX')
  set term=screen-256color
endif


let g:syntastic_python_checkers = ['pyflakes']
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

"Key Map"
map<F5> :w<cr>:!python %<cr>
nmap <F8> :TagbarToggle<cr>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
nnoremap <F3> :set invpaste paste?<CR>
imap <F3> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F3>
" Stoping searching
nmap <F2> :nohlsearch<CR>
"Taglist"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

"Disable EX mode"
map Q <Nop>
map f <Nop>

" Clang complete options
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_close_preview=1
let g:clang_use_library=1
let g:clang_user_options='|| exit 0'
" let g:clang_user_options='-std=c++11'
" let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
" let g:snips_trigger_key = '<C-\>'
" imap ss <esc>a<Plug>snipMateNextOrTrigger
" smap ss <Plug>snipMateNextOrTrigger
" NERDTree shortcut map
map <C-e> :NERDTreeToggle<CR>

"Faster shortcut for commenting. Requires T-comment plugin
map <leader>c <c-_><c-_>


" For C++ indentation
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2

" For pymode driving
" Disable all rope completions, since it is much worse than Omni-completion.
let g:pymode_rope=0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0

"syntastic checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
