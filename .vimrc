" Plugins will be downloaded under the specified directory.
  call plug#begin('~/.vim/plugged')
  
  " Declare the list of plugins.
  Plug 'sbdchd/neoformat'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'leafgarland/typescript-vim'
  Plug 'mattn/emmet-vim'
  Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
  Plug 'preservim/nerdtree'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  
  " files exptention highlights and icons
  Plug 'ryanoasis/vim-devicons'
  
  
  " List ends here. Plugins become visible to Vim after this call.
  call plug#end()
  
  " Use formatprg when available
  " let g:neoformat_try_formatprg = 1
  let g:neoformat_run_all_formatters = 1
  " Vim-emmet
  let g:user_emmet_leader_key=','
  
  augroup NeoformatAutoFormat
      autocmd!
      autocmd FileType javascript setlocal formatprg=prettier\
                                               \--stdin\
                                               \--print-width\ 80\
                                               \--single-quote\
                                               \--trailing-comma\ es5
      autocmd BufWritePre,TextChanged,InsertLeave  *.js Neoformat
  augroup END
  
  autocmd BufWritePre,TextChanged,InsertLeave *.html Neoformat
  autocmd BufWritePre,TextChanged,InsertLeave *.css Neoformat
  autocmd BufWritePre,TextChanged,InsertLeave *.scss Neoformat
  autocmd BufWritePre,TextChanged,InsertLeave *.ts Neoformat
  autocmd BufWritePre,TextChanged,InsertLeave *.tsx Neoformat
  " autocmd vimenter * NERDTree
  
  colorscheme monokai  
  set number
  set modifiable
  set encoding=UTF-8
  
  " Mappings
  map <C-n> :NERDTreeToggle<CR>
  inoremap " ""<left>
  inoremap ' ''<left>
  inoremap ( ()<left>
  inoremap [ []<left>
  inoremap { {}<left>
  inoremap {<CR> {<CR>}<ESC>O
  inoremap {;<CR> {<CR>};<ESC>O

 
  "File search fzf"
  map ; :Files<CR>
  " map : :Buffers<CR>
  
  " NERDTrees File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
   exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  
  call NERDTreeHighlightFile('ts', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('tsx', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
  
  " Nerd tree icons
  set guifont=DroidSansMono\ Nerd\ Font\ 11

" Tab numbers
set showtabline=2

" Custom status bar
set laststatus=2
set noshowmode

