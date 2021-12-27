let mapleader = " "

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
call plug#end()

"VScode dark theme
colorscheme codedark
set background=dark
set term=screen-256color

" line in the current cursor
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" vimwiki
let g:vimwiki_list = [{'path': '~/MEGAsync/wiki/','syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_list = [{'auto_diary_index': 1}]


"vimwiki will only set the filetype of markdown files inside a wiki directory
let g:vimwiki_global_ext = 0

filetype plugin on
"Uncomment to override defaults:
""let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0   " disable autostart
map <leader>M :InstantMarkdownPreview<CR>
""let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
""let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
""let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
""let g:instant_markdown_python = 1

"map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
"  " " map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i

" Vertically center  document when entering insert mode
autocmd InsertEnter * norm zz

" Goyo plugin
nmap <leader>m :Goyo 100 \| set linebreak<CR>

"Nerd Tree settings
" Open Nerd tree everytime
"   autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"Ctrl-t to toggle nerd tree
nnoremap <C-t> :NERDTreeToggle<CR>

"nerd tree window size
let g:NERDTreeWinSize=20


set encoding=UTF-8

"For VTE compatible terminals (urxvt, st, xterm, gnome-terminal 3.x, Konsole KDE5 and others) and wsltty,Cursor changes according to mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


set ignorecase
"When search stars with Uppercase only uppercase ones are searched
set smartcase

"Mapping esc to jj
inoremap jj <ESc>
nnoremap <silent> <Leader>t gT
"nnoremap T :terminal<CR>


" move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>r :register<CR>
"nnoremap <silent> <Leader>l :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>h: :Helptags<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <Leader>H :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
" Ctrl-v for visual block mode
nnoremap <silent> <leader>v <C-v>
" Substitution by S
"noremap S :%s//gI<left><left>
nnoremap <leader>R :source ~/.vimrc<CR>


cmap w!! w !sudo tee > /dev/null %

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

"Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>

" double space to change buffers
nnoremap <leader><leader> <c-^>

nnoremap <leader>q :qa!<cr>
nnoremap <leader>d :q!<cr>
"nnoremap <leader>w :wa<cr>
nnoremap <leader>x :xa!<cr>
nnoremap <Leader>s :mksession!<CR>


" Spell check set to <leader>o, 'o' for 'orthography':
nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>

" allows changing buffer without editing
set hidden

syntax on

" autosave
autocmd TextChanged,TextChangedI <buffer> silent write

" Save whenever switching windows or leaving vim. This is useful when running
" " the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" Doesn't wrap the text
set linebreak

" For backward compatibility prior to vim 8
set nocompatible

set number relativenumber
augroup toggle_relative_number
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber

set numberwidth=4
" enable mouse on all modes
set mouse=a



" no swap/backup files
set nobackup nowritebackup
set noswapfile


" Enable and disable auto commenting
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

"Jumping point
"map <Space>p i<__
"inoremap <Space>p <__
"map <Space>j <Esc>/<__<Enter>"_c3l
"inoremap <Space>j <Esc>/<__<Enter>"_c3l

" Shows incomplete command in the bottom
set wildmenu

" Sets auto indentation
set ai
" Enable Disable Auto Indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Indentation without hard tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" don't keep search highlighted
set nohlsearch

" highlights as you search
set incsearch

" ignore case while searching
set ic

" don't circle the file while searching.
set nows


"" highlight trailing whitespace
"match ErrorMsg '\s\+$'
" " remove trailing whitespaces automatically
"autocmd BufWritePre * :%s/\s\+$//e




" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan


" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
   \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%1*\ %n\                                 " Buffer number
set statusline+=%1*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%=                                       " Right Side
set statusline+=%1*\ %Y\                                 " FileType
"set statusline+=%3*│                                     " Separator
set statusline+=%1*\ \ %02v\                         " Colomn number
"set statusline+=%3*│                                     " Separator
set statusline+=%1*\ \ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

hi clear SpellBad
hi SpellBad cterm=underline


" Fix splitting orientation when splitting
set splitbelow splitright

"Better split bar
highlight VertSplit cterm=NONE

"  to generate new vertical split
"nnoremap <silent>s <C-w>v

" easy window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
