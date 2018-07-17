"======================================
    " Pathogen
"======================================
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
syntax enable
syntax spell toplevel


" set guifont=Ubuntu\ Mono:h8
set guifont=DejaVu\ Sans\ Mono\ 7.2
set linespace=2

"======================================
" SOLARIZED COLOR SCHEME ==============
"======================================
if has('gui_running')
    set background=dark
    " let g:solarized_termtrans= 0
    " let g:solarized_degrade=0
    " let g:solarized_bold=1
    " let g:solarized_underline =   1
    " let g:solarized_italic    =   1
    " let g:solarized_contrast  =   "normal"
    " set bg=dark
    " colorscheme solarized

    colorscheme gruvbox
    let g:gruvbox_italic=1
else
    set term=xterm-256color
    " set background=light
	set background=dark
    let g:gruvbox_italic=1
    " let g:gruvbox_guisp_fallback='bg'
    colorscheme gruvbox
    " let g:gruvbox_underline =   1
    " set termguicolors
    " colorscheme solarized
endif

" set background=dark
" let g:gruvbox_italic=1
" set termguicolors
" set t_Co=256
" colorscheme gruvbox
" colorscheme solarized
"========================================


"=========================================
" MAPPING LEADER
" ========================================
let mapleader = ","
"======================================================================="
" Make check spelling on or off 
nmap <leader>cson   :set spell<CR>
nmap <leader>csoff  :set nospell<CR>
if (has("gui_running"))
    let s:c = ",undercurl"                                     
else                                                                         
    hi clear SpellBad
    hi SpellBad cterm=underline
endif
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
"======================================================================="


"==========================================
" LATEX SUITE
" REQUIRED. This makes vim invoke Latex-Suite
" when you open a tex file.
"===========================================
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
set winaltkeys=no   "needed to use ALT key in vim-latex
" ========================================================================================
" OPTIONS TAKEN from https://github.com/xmementoit/vim-ide/blob/master/vimrc
" ========================================================================================
" Make vim incompatbile to vi.
set nocompatible
set modelines=0

" ========================================================================================
"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set showtabline=4
set ruler
set autoindent
set smartindent
set fileformat=unix
set smarttab          " smart tab handling for indenting
set ttyfast           " faster redrawing
set clipboard=unnamed " system clipboard
"set cindent
"
set encoding=utf-8

set nobackup
set noswapfile

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>


" Dictionary path, from which the words are being looked up.
" ========================================================================================
set dictionary=/usr/share/dict/words

" ========================================================================================
" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set colorcolumn=+1
"set formatoptions=qrn1
"set colorcolumn=79

" ========================================================================================
" To  show special characters in Vim
"set list
" set listchars=tab:▸\ ,eol:¬,trail:⋅,nbsp:⋅
set listchars=tab:▸⋅,eol:¬,trail:⋅,nbsp:⋅
set showbreak=↪
"==========================================================================="
" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =

"==========================================================================="
" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END




"===================================================================================================
" Commenting blocks of code.
autocmd FileType c,cppva,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python let b:comment_leader = '# '
" ========================================================================================

" EXTRA
"set noexpandtab
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*.aux,*.blg,*.dvi,*.gz,*.bbl,*.log
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

set ignorecase   " ignore case when searching
set smartcase    " but become uppercase if capital is typed

" spell check
set spell spelllang=en_us
set thesaurus=~/.vim/thesaurus/mthesaur.txt



" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a
set guioptions-=T  "remove toolbar

"execute "set <M-l>=^[[l"
"nnoremap <M-l> l

" LaTeX customization
"
let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats='pdf,dvi'
let g:Tex_UsePython=1
let g:Tex_GotoError=1
let g:Tex_SmartKeyQuote=1
let g:Tex_ViewRule_pdf='evince'

let g:Tex_IgnoredWarnings =
\'Underfull'."\n".
\'Overfull'."\n".
\'specifier changed to'."\n".
\'You have requested'."\n".
\'LaTeX Font Warning:'
" \'Missing number, treated as zero.'."\n".
" \'There were undefined references'."\n".
" \'Citation %.%# undefined'."\n".
let g:Tex_IgnoreLevel = 8


" clang
"let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
" disable NeoComplete when using LaTeX
autocmd FileType tex NeoCompleteLock
autocmd FileType bib NeoCompleteLock
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 0

" disable youcompleteme for certain file types
let g:ycm_filetype_blacklist = {
    \ 'tex' : 1
    \}

" <TAB>: completion.
  " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        " \ <SID>check_back_space() ? "\<TAB>" :
        " \ neocomplete#start_manual_complete()
  " function! s:check_back_space() "{{{
    " let col = col('.') - 1
    " return !col || getline('.')[col - 1]  =~ '\s'
  " endfunction"}}}
"

" Toggle NERDTree
nmap <silent> <leader>l :TlistToggle<cr>
nmap <silent> <leader>k :NERDTreeToggle<cr>

" customization of NERDCommenting
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

set laststatus=2
set relativenumber

" airline settings
 if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_theme='solarized'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline_detect_paste=1
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = ' '


" Ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["~/.vim/bundle/vim-snippets/UltiSnip"]


nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" ctrlP configuration: set current dir as starting point
let g:ctrlp_working_path_mode = 'cr'
let g:ctrlp_root_markers=['.tex','.cpp','.py']
let g:ctrlp_max_files=0
" let g:ctrlp_working_path_mode=""   " use this to have global root
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux
set path+=**
set wildmenu


" MY SNIPPETS
nnoremap ,header :-1read $HOME/.vim/snippets/header.txt<CR>20jA
" CtrP will find all the files

" Close a buffer without closing a window (e.g., when splits are used)
command Bd bp\|bd \#

" This is used to have ALT working in terminal mode
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

syntax enable
set termguicolors

"============================================================ 
" the following is used to disable Background Color Erase (BCE)
" this is needed for tmux
set t_ut=
"============================================================ 
"
"
set foldmethod=indent
set foldlevel=99
