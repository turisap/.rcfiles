" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
  
" Declare the list of plugins.
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'dense-analysis/ale'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'takac/vim-hardtime'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'roxma/nvim-yarp'  
Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'Shougo/denite.nvim'
" Plug 'rking/ag.vim'
" list ends here. Plugins become visible to Vim after this call.
call plug#end()
  
" vim-emmet
let g:user_emmet_leader_key='.'
  
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" General
set number
set modifiable
set ignorecase
set smartcase

" mappings
let mapleader = "\<Space>"
" imap jj <Esc>
" cmap <Esc> <C-\><C-n>

" reload vim config
nmap <leader>rl :source ~/.vimrc<CR>

" nerdtree
nmap <C-n> :NERDTreeToggle<CR>

" ale mappings
nmap <leader>ii :ALEHover<CR>
nmap <leader>id :ALEGoToDefinition<CR>

" go to next error
nmap <silent><leader>ek <Plug>(ale_previous_error)
nmap <silent><leader>ej <Plug>(ale_next_error)

" open git status ???
nmap <silent><Leader>gs :Gstatus<CR>

" plugins operations
nmap <leader>pi :PlugInstall<CR>
nmap <leader>pu :PlugUpdate<CR>
nmap <leader>pc :PlugClean<CR>

" hardtime on / off
nmap <leader>ht :HardTimeToggle<CR>

" fzf
map <leader>; :Files<CR>
  
" nerdtree file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
  
call NERDTreeHighlightFile('ts', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('tsx', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
  
" nerd tree icons
set encoding=UTF-8

" tab numbers
set showtabline=2

" custom status bar
set laststatus=2
set noshowmode

" ale settings
let g:ale_fixers = { 
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\ 'typescriptreact': ['prettier'],
\ 'scss': ['prettier'],
\ 'svg': ['xmllint'],
\ 'xml': ['xmllint'],
\ 'html': ['prettier'],
\ 'eruby': ['prettier']
\ }

let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint', 'tsserver'],
\   'scss': []
\}

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '??'
let g:ale_fix_on_save = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" deoplete settings
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete', 'False')

" yats highlihting
let g:yats_host_keyword = 1


" denite config
" !!!!! For this search to work you need to install the_silver_searcher
" call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" call denite#custom#option('default', 'prompt', 'λ')
" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])

" nmap <silent><buffer><expr> <CR> denite#do_map('do_action')
" " nmap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
" " nmap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
" nmap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
" nmap <silent><buffer><expr> <C-x> denite#do_map('do_action', 'split')
" nmap <silent><buffer><expr> <Esc> denite#do_map('quit')
" " nmap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
" nmap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
" nnoremap <silent><buffer><expr> q denite#do_map('quit')


" nmap <leader>pp :Denite -start-filter file/rec<CR>
" nmap <leader>pb :Denite buffer<CR>
" nmap <leader>pg :Denite grep<CR>


" vim hardtime
let g:hardtime_showmsg = 1
let g:hardtime_maxcount = 2
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD*" , "denite*"]

" airline settings
let g:airline#extensions#tabline#enabled = 1
