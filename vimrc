set nocompatible
runtime macros/matchit.vim

filetype off
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on
filetype plugin indent on
set ofu=syntaxcomplete#Complete

colorscheme darkblood

" Fix keys
if &term =~ "rxvt"
	exec "set <kPageUp>=\<ESC>[5^"
	exec "set <kPageDown>=\<ESC>[6^"
endif

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

nnoremap <F3> :set invcul cul?<CR>
imap <F3> <C-o>:set invcul cul?<CR>

nnoremap <F4> :set invcursorcolumn cursorcolumn?<CR>
imap <F4> <C-o>:set invcursorcolumn cursorcolumn?<CR>

nnoremap <F5> :call ColorColumnToggle()<CR>
imap <F5> <C-o>:call ColorColumnToggle()<CR>

nnoremap <C-c> :redraw!<CR>
imap <C-c> <C-o>:redraw!<CR>

function ColorColumnToggle()
	if &colorcolumn
		set colorcolumn=
	else
		set colorcolumn=80
	endif
endfunction

set mouse=c
set directory=~/.tmp
set backupdir=~/.tmp
set backup
set noerrorbells
set novisualbell
set magic
set hidden
set shortmess=atI
set wildignore+=*.o,*.obj,.git,*.a,*.so
let mapleader="ò"

set fileencodings=utf-8,latin1
set encoding=utf-8
set termencoding=utf-8
set guifont=Terminus\ 8

set helplang=en
set history=1000
set hlsearch
set incsearch
set sidescroll=1
set scrolloff=3
set nowrap

set autoindent
set smartindent
set smarttab
set smartcase
set shiftwidth=2
set ts=2
set noexpandtab
set modeline
set tildeop
set cpoptions+=$

set statusline=%F%m%r%h%w\ [Type:\ %Y]\ [Lines:\ %L\ @\ %p%%\ {%l;%v}]\ %{fugitive#statusline()}
set laststatus=2

set number
set showmode ruler

set wildmode=longest:full
set wildmenu

" Commands
command -range=% Share silent <line1>,<line2>write !curl -s -F "sprunge=<-" http://sprunge.us | head -n 1 | tr -d '\r\n ' | xclip
command -nargs=1 Indentation silent set ts=<args> shiftwidth=<args>
command -nargs=1 IndentationLocal silent setlocal ts=<args> shiftwidth=<args>

" Mappings
map RE gq}

map <F1> <Nop>
imap <F1> <Nop>
vmap <F1> <Nop>

map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> <C-O>1000<C-U>
imap <silent> <PageDown> <C-O>1000<C-D>

" Disable arrows to learn to stop using them
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Tabs
map <silent> <C-T> :tabnew<CR>
map <silent> <C-W> :tabclose<CR>
map <silent> <kPageUp> :tabprevious<CR>
map <silent> <kPageDown> :tabnext<CR>
map <silent> <Leader>H :tabprevious<CR>
map <silent> <Leader>L :tabnext<CR>
imap <silent> <C-T> <C-O>:tabnew<CR>
imap <silent> <C-W> <C-O>:tabclose<CR>
imap <silent> <kPageUp> <C-O>:tabprevious<CR>
imap <silent> <kPageDown> <C-O>:tabnext<CR>
map <silent> <C-H> :tabfirst<CR>
imap <silent> <C-H> <C-O>:tabfirst<CR>

" Windows
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <silent> <C-J> :wincmd j<CR>

inoremap <silent> <C-H> <C-O>:wincmd h<CR>
inoremap <silent> <C-K> <C-O>:wincmd k<CR>
inoremap <silent> <C-L> <C-O>:wincmd l<CR>
inoremap <silent> <C-J> <C-O>:wincmd j<CR>

" File handling
map <Leader>N :NERDTreeToggle<CR>
map <Leader>F :CommandT<CR>
map <Leader>B :CommandTBuffer<CR>
map <Leader>T :TagbarToggle<CR>
map <Leader>R :CommandTFlush<CR>
map <Leader>U :GundoToggle<CR>
map <Leader>S :mksession! .vim.session<CR>
map <Leader>n :nohlsearch<CR>

" Better ESC
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^

" Syntastic
let g:syntastic_enable_signs = 1

let c_no_curly_error   = 1
let g:localrc_filename = '.lvimrc'

" Command-T
let g:CommandTMaxFiles          = 100000
let g:CommandTMaxDepth          = 100
let g:CommandTNeverShowDotFiles = 1

" cctree
let g:CCTreeUsePerl        = 1
let g:CCTreeUseUTF8Symbols = 1

" Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'darkblood'

" vimshell
let g:vimshell_no_default_keymappings = 1
let g:vimshell_environment_term       = 'rxvt'
let g:vimshell_scrollback_limit       = 10240

autocmd FileType vimshell
	\  nmap <buffer> <CR> <Plug>(vimshell_enter)
	\| imap <buffer> <CR> <C-]><Plug>(vimshell_enter)
	\| imap <buffer> <CR> <C-]><Plug>(vimshell_enter)
	\| nmap <buffer> <expr><silent> H unite#sources#vimshell_history#start_complete(!0)

autocmd FileType int-*
	\  nmap <buffer> <CR> <Plug>(vimshell_int_execute_line)
	\| imap <buffer> <CR> <C-]><Plug>(vimshell_int_execute_line)
	\| nmap <buffer> <expr><silent> H unite#sources#vimshell_history#start_complete(!0)

" neocomplcache
autocmd VimEnter * call DoNeoComplCache()
function! DoNeoComplCache()
	NeoComplCacheEnable
	NeoComplCacheLock

	autocmd Filetype * if &filetype !=# 'vimshell' | NeoComplCacheLock | endif
endfunction

" vinarise
let g:vinarise_enable_auto_detect = 1
let g:vinarise_detect_large_file_size = -1

autocmd FileType vinarise
	\  nmap <buffer> <C-l> :wincmd l<CR>
	\| nmap <buffer> <C-c> <Plug>(vinarise_redraw)

" aliases
autocmd VimEnter * call DoAliases()
function! DoAliases()
	Alias W  w
	Alias Wq wq
	Alias Q  q
	Alias Qw wq
endfunction

" arpeggios
"autocmd VimEnter * call DoArpeggios()
function! DoArpeggios()
	Arpeggio inoremap jk <ESC>
	Arpeggio inoremap kl <CR>

	Arpeggio inoremap ui <BS>
	Arpeggio inoremap io <DEL>

	Arpeggio inoremap ji <C-O>^
	Arpeggio inoremap ko <C-O>$
endfunction

" utilities
map <Leader>p :call MarkdownPreview()<CR>
function! MarkdownPreview()
	silent update
	let output_name = tempname() . '.html'

	let file_header = ['<html>', '<head>',
		\ '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">',
		\ '<title>'.expand('%:p').'</title>',
		\ '</head>', '<body>']

	call writefile(file_header, output_name)

	silent exec '!~/.vim/bin/github-flavored-markdown.rb "' . expand('%:p') . '" >> "' . output_name . '"'
	silent exec '!echo "</body></html>" >> "' . output_name . '"'
	silent exec '!xdg-open "' . output_name . '" &'

	redraw!
endfunction
