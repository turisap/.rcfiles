call plug#begin("~/.vim/plugged")
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'takac/vim-hardtime'
Plug 'jiangmiao/auto-pairs'
Plug 'HerringtonDarkholme/yats.vim' 
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" INSTALL PRETTIER EXTENSION FOR COC-NVIM TO FORMAT STYLES https://github.com/neoclide/coc-prettier
" INSTALL COCNVIM CODE SNIPPETS https://github.com/neoclide/coc-snippets
" INSTALL COC-YAML 
call plug#end()

" Config Section

"general
set number
set modifiable

colorscheme gruvbox

" indent
set autoindent
set shiftwidth=2

" search for all cases if input is lowercase and for exact case if another
set ignorecase
set smartcase

" gives tips if <Tab> pressed in command mode
set wildmenu

" removes transparency
highlight Normal ctermbg=Black
highlight NonText ctermbg=Black


let mapleader = "\<Space>"

" splitting window
nmap <leader>s :vsplit<CR>

" files importing path suggesstion
imap <leader>fs <C-x><C-f>

" writing all and qutting
nmap <leader>q :wq<CR>
nmap <leader>w :wall<CR>

" buffers navigation
nmap <leader>bn :bnext<CR>
nmap <leader>bb :b#<CR>
nmap <leader>bp :bprevious<CR>

" tabs navigation
nmap <leader>tt :tabnew<CR>
map <leader>tn :tabn<CR>
map <leader>tp :tabp<CR>

" addding and removing empty lines
nnoremap <leader>ed :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <leader>eu :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <leader>dd m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <leader>du m`:silent -g/\m^\s*$/d<CR>``:noh<CR>

" windows navigation
nmap <leader>h <C-w>h
nmap <leader>l <C-w>l
nmap <leader>wo <C-w>o
nmap <leader>wc <C-w>c

" quitting insert mode
imap jj <Esc>

" clear highlights for search results
noremap <leader>c :set hlsearch! hlsearch?<CR>

" editing
nmap <leader>rr :redo<CR>

" reload vim config
nmap <leader>rl :source ~/.config/nvim/init.vim<CR>

" rebuild helptags (vim should be launced with sudo)
nmap <leader>tgh :helptags $VIMRUNTIME/doc<CR>

" plugins operations
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pc :PlugClean<CR>

" hardtime on / off
nmap <leader>ht :HardTimeToggle<CR>

" fzf
map <leader>; :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" prepend the current line (insert text at the start)
nmap <leader>tt _i

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent><C-b> :NERDTreeToggle<CR>



" hard time config
let g:hardtime_default_on = 1
let g:hardtime_timeout = 2000
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]
let g:hardtime_maxcount = 3

" con.nvim code completion
" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" inoremap <expr> <leader><leader> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" hi CocInfoFloat guifg=#fc0703 guibg=#fc0703
" hi CocErrorFloat guifg=#fc0703 guibg=#fc0703
" hi CocWarningFloat guifg=#fc0703 guibg=#fc0703

" auto reload when file is changed by an external pogram
    " trigger `autoread` when files changes on disk
      set autoread
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    " notification after file change
      autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl Noner
