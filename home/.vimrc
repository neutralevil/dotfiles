set langmenu=none         " force to use the English menu
set nocompatible          " be iMproved
filetype off              " required!

" Setting up NeoBundle - the vim plugin bundler
let neo_bundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neo_bundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
endif

if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" color schemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'NLKNguyen/papercolor-theme'

" view
NeoBundle 'bling/vim-airline'
NeoBundle 'ntpeters/vim-better-whitespace'

" languages
NeoBundle 'Mizuchi/STL-Syntax'
NeoBundle 'wlangstroth/vim-racket'

NeoBundle 'tpope/vim-leiningen.git'
NeoBundle 'tpope/vim-projectionist.git'
NeoBundle 'tpope/vim-dispatch.git'
NeoBundle 'tpope/vim-fireplace.git'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'guns/vim-clojure-highlight'

NeoBundle 'tfnico/vim-gradle'
let neo_bundle_enabled=0
" if has('lua')
"     NeoBundle 'Shougo/neocomplete.vim'
"     let neo_bundle_enabled=1
" endif
"


NeoBundle 'matchit.zip'
NeoBundle 'justinmk/vim-sneak'


filetype plugin indent on     " required!

" If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
NeoBundleCheck

" Setting up NeoBundle - the vim plugin bundler end
call neobundle#end()

""
"" Basic Setup
""

if has("mac")
    set macmeta           " Use option (alt) as meta key, to enable bindings to <M->
endif
set number            " Show line numbers
set relativenumber
set ruler             " Show line and column number
set laststatus=2      " Always show the status bar
syntax enable         " Turn on syntax highlighting allowing local overrides
let mapleader = " "
set fileencodings=ucs-bom,utf-8,cp936
set encoding=utf-8    " Set default encoding to UTF-8

""
"" View settings
""
set background=dark
colorscheme solarized
if has('gui_running')
    set guifont=PragmataPro\ for\ Powerline:h13
    " colorscheme Tomorrow-Night-Blue
    colorscheme PaperColor
else
endif
set noshowmode          " otherwise messages shown at the bottom line
                        " won't be seen in some modes.
set scrolloff=5
set guioptions-=T       "Hide toolbar
set guioptions-=r       "Hide right vertical scroll bar
set guioptions-=L       "Hide left vertical scroll bar
set guioptions-=e       "Use non-GUI tabline

""
"" Editing Settings
""

set autoindent
set smartindent

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

"if exists("g:enable_mvim_shift_arrow")
"  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
"endif

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:▸\               " a tab should display as "  "
" set listchars+=trail:•            " show trailing spaces as dots
set listchars+=extends:▶          " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:◀         " The character to show in the last column when wrap is
" off and the line continues beyond the left of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
"set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set autowrite                      " Auto save before make
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.
"set nobackup
"set nowritebackup
"set noswapfile

""
"" Autocmds
""

autocmd FocusLost * silent! wall

""
"" File types
""

" Some file types should wrap their text
function! s:setupWrapping()
    setlocal wrap
    setlocal linebreak
    setlocal textwidth=78
    setlocal formatoptions+=2
    setlocal nolist
endfunction

" In Makefiles, use real tabs, not tabs expanded to spaces
autocmd FileType make setlocal noexpandtab

autocmd FileType mkd,markdown call s:setupWrapping()

" Treat JSON files like JavaScript
autocmd BufNewFile,BufRead *.json set filetype=javascript

autocmd FileType ruby,xml setlocal softtabstop=2 tabstop=2 shiftwidth=2

"if has("mac")
"    let g:filetype_m='objc' " .m files are Objective-C, not Matlab
"endif

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal! g`\"" | endif

""
"" GUI settings
""

if has("gui_running")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
endif

""
"" General Mappings (Normal, Visual, Operator-pending)
""

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" upper/lower word
"nmap <leader>u mQviwU`Q
"nmap <leader>l mQviwu`Q

" upper/lower first char of word
"nmap <leader>U mQgewvU`Q
"nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" set text wrapping toggles
"nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

""
"" Command-Line Mappings
""

" After whitespace, insert the current directory into a command-line path
cnoremap <expr> <C-P> getcmdline()[getcmdpos()-2] ==# ' ' ? expand('%:p:h') : "\<C-P>"

""
"" Bundle settings
""

" vim-airline
let g:airline#extensions#tabline#enabled = 1

if !has("windows")
    " error occurs on cygwin version
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
endif

let g:airline_powerline_fonts=1
" let g:airline_symbols = {}
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.whitespace = 'Ξ'

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'REP',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V-',
            \ '' : 'V|',
            \ 's'  : 'S',
            \ 'S'  : 'S-',
            \ '' : 'S|',
            \ }

" vim-better-whitespace
autocmd FileType unite,vimfiler :DisableWhitespace
autocmd FileType qf :DisableWhitespace

" vim-sneak
let g:sneak#s_next = 0
let g:sneak#textobject_z = 0
" visual-mode
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
" operator-pending-mode
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S


