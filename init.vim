call plug#begin()
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'vim-scripts/taglist.vim'
Plug 'StanAngeloff/php.vim'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'borissov/vim-mysql-suggestions'
Plug 'jparise/vim-graphql'
Plug 'scrooloose/syntastic'
Plug 'yggdroot/indentline'
Plug 'symfony/symfony'
Plug 'morhetz/gruvbox'
Plug 'blueshirts/darcula'
Plug 'gosukiwi/vim-atom-dark'
Plug 'posva/vim-vue'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'noahfrederick/vim-laravel'
Plug 'yuezk/vim-js'
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch':'release','do': 'yarn install --forzen-lockfile'}
Plug 'yaegassy/coc-volar', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-volar-tools', {'do': 'yarn install --frozen-lockfile'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production', 'branch': 'release/0.x' }
Plug 'navarasu/onedark.nvim'

call plug#end()


set number
syntax enable
"set background=dark
"colorscheme gruvbox

syntax on
set t_Co=256
set cursorline
"one dark
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark
"half dark
"colorscheme onehalfdark
"let g:airline_theme='onehalfdark'
" lightline
"let g:lightline = { 'colorscheme': 'onehalfdark' }

set laststatus=2
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
nnoremap <C-l> gt
nnoremap <C-h> gT
nmap <silent> gd <Plug>(coc-definition)
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
hi phpUseNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
hi phpClassNamespaceSeparator guifg=#808080 guibg=NONE gui=NONE
syn match phpParentOnly "[()]" contained containedin=phpParent
hi phpParentOnly guifg=#f08080 guibg=NONE gui=NONE

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:phpcd_php_cli_executable = 'php'
let g:indentLine_setColors = 0


let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-pairs',
            \'coc-tsserver',
            \'coc-eslint',
            \'coc-prettier',
            \'coc-json',
            \'coc-phpls',
            \'coc-go',
            \]
let g:coc_global_config="~\AppData\Local\nvimcoc-settings.json"
