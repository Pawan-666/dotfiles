let mapleader = " "
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tomasiser/vim-code-dark'
Plug 'mcchrish/nnn.vim'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

inoremap jj <ESc>
execute "set <M-f>=^[f"
noremap <M-e> <M-f>
"let g:nnn#command = 'nnn -oH'
" Exit Vim if NnnExplorer is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && &filetype ==# 'nnn' | quit! | endif
let g:nnn#action = {
\ '<c-t>': 'tab split',
\ '<c-x>': 'split',
\ '<c-v>': 'vsplit' }
" Close the tab if NnnExplorer is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && &filetype ==# 'nnn' | quit! | endif
" Disable default mappings
let g:nnn#set_default_mappings = 0

" Set custom mappings
"nnoremap <silent> <leader>nn :NnnPicker<CR>

" Start n³ in the current file's directory
"nnoremap <leader>n :NnnPicker %:p:h<CR>
nnoremap <C-t> :NnnPicker %:p:h<CR>
"nnoremap <C-t> :NnnExplorer <CR>

" Or pass a dictionary with window size
let g:nnn#layout = { 'left': '~20%' } " or right, up, down
"VScode dark theme
"colorscheme codedark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_termcolors= '256'
colorscheme gruvbox
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
let g:calendar_diary='~/MEGAsync/wiki/diary'
"let g:vimwiki_list = [{'auto_diary_index': 1}]


"vimwiki will only set the filetype of markdown files inside a wiki directory
let g:vimwiki_global_ext = 0

filetype plugin on
"Uncomment to override defaults:
""let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0   " disable autostart
map <leader>M :InstantMarkdownPreview<CR>
"              #markdown  41j
""let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
""let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
""let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
""let g:instant_markdown_python = 1

"Markdown shortcuts
"imap 'b ____<esc>hi
"imap 'i **<esc>i
"imap 'I ******<esc>2hi
"imap 'r ---<esc>Ojjj2ojji
"imap 'u <><esc>i
"imap 'li [![Image](s "t")](https://.com)
""To emphasize links, add asterisks before and after the brackets and parentheses. To denote links as code, add backticks in the brackets.
"imap 'l [](https://.com t)<esc>2Ba
"imap 'a <abbr title=""></abbr><esc>2bla
"imap 'p ![Image](s "")<esc>hi
""Blockquotes can contain multiple paragraphs. Add a > on the blank lines between the paragraphs
"imap 'q ><esc>a
""nested blockquotes
"imap 'q2 >><esc>a
"imap 'qb >____<esc>ha
"imap 'qh >###
"imap 'q3 >>><esc>a
"imap 'q4 >>>><esc>a
"imap 'q5 >>>>><esc>a
"imap 'q6 >>>>>><esc>a
"imap 'c ``<esc>i
"imap 'cb ``````<esc>2hi<CR><esc>O
"imap 'cs ```sh```<esc>2hi<CR><esc>O
"imap 'cp ```python```<esc>2hi<CR><esc>O
"imap 'ch ```html```<esc>2hi<CR><esc>O
"imap 'cj ```js```<esc>2hi<CR><esc>O
"imap '1 #<esc>a
"imap '2 ##<esc>a
"imap '3 ###<esc>a
"imap '4 ####<esc>a

"map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
"  " " map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i


" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Change Working Directory to that of the cu--- ent file
"cmap cwd lcd %:p:h
"cmap cd. lcd %:p:h
"map <leader>F :cd %:h<CR>
set autochdir
autocmd BufEnter * lcd %:p:h

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv


set encoding=UTF-8
set showmatch                   " Show matching brackets/parenthesis


"For VTE compatible terminals (urxvt, st, xterm, gnome-terminal 3.x, Konsole KDE5 and others) and wsltty,Cursor changes according to mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


set ignorecase
"When search stars with Uppercase only uppercase ones are searched
set smartcase

"Mapping esc to jj
nnoremap <silent> <C-n> gt
nnoremap <silent> <C-p> gT
"nnoremap T :terminal<CR>


" move lines up and down
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <silent> <Leader>l :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>r :register<CR>
"nnoremap <silent> <Leader>l :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>h: :Helptags<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <Leader>H :History:<CR>
nnoremap <silent> <Leader>/ :History/<CR>
" Ctrl-v for visual block mode
"nnoremap <silent> <leader>v <C-v>
" Substitution by S
nnoremap <leader>R :source ~/.vimrc<CR>
"nnoremap <leader>S :%s//gI<left><left>

nnoremap <C-c> <LocalLeader>cal

cmap w!! w !sudo tee > /dev/null %

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

"Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>

" double space to change buffers
nnoremap <leader><leader> <c-^>
nnoremap <leader>q :qa!<cr>
nnoremap <leader>d :q!<cr>
"nnoremap <leader>w :wa<cr>
nnoremap <leader>s :wa<cr>
"nnoremap <Leader>S :mksession


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

set nu rnu
"map <leader>n :set nonu nornu<CR>
"map <leader>N :set number relativenumber<CR>
"augroup toggle_relative_number
"autocmd InsertEnter * :setlocal norelativenumber
"autocmd InsertLeave * :setlocal relativenumber

set numberwidth=5
" enable mouse on all modes
set mouse=a
" Hide the mouse cursor while typing
set mousehide

set timeoutlen=500              " how long it wait for mapped commands
set ttimeoutlen=100             " faster timeout for escape key and others

" no swap/backup files
set nobackup nowritebackup
set noswapfile


" Enable and disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
map <leader>C :setlocal formatoptions-=cro<CR>
map <leader>c :setlocal formatoptions=cro<CR>

"Jumping point
"map <space>p i<__
"inoremap <Space>p <__
"map <Space>j <Esc>/<__<Enter>"_c3l
"inoremap <Space>j <Esc>/<__<Enter>"_c3l

" Shows incomplete command in the bottom
set wildmenu


"set autoindent smartindent      " auto/smart indent
set autoindent       " auto indent
" Enable Disable Auto Indent
map <leader>i :set autoindent!<CR>
" Indentation without hard tabs
set expandtab                   " Expand tabs to spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

set copyindent                  " copy previous indentation on auto indent
"set softtabstop=4               " Tab key results in # spaces
"set tabstop=4                   " Tab is # spaces
"set shiftwidth=4                " The # of spaces for indenting.
"set smarttab                    " At start of line, <Tab> inserts shift width
                                "   spaces, <Bs> deletes shift width spaces.

"set paste
set pastetoggle=<F2>

" apt-get install vim-gtk  for system wide clipboard support, "+p  for pasting big text
set clipboard=unnamedplus

" don't keep search highlighted
set nohlsearch

" highlights as you search
set incsearch

" ignore case while searching
set ic

" don't circle the file while searching.
set nows


"" highlight trailing whitespace
nnoremap <leader>S :match ErrorMsg '\s\+$'<CR>
 " remove trailing whitespaces automatically
"autocmd BufWritePre * :%s/\s\+$//e
"nnoremap <leader>S :autocmd BufWritePre * :%s/\s\+$//e<CR>




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
