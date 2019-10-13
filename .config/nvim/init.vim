" Install vim-plug if not existent
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rbgrouleff/bclose.vim' "lf.vim dependency
Plug 'ptzz/lf.vim'
Plug 'rhysd/vim-clang-format' " Format C-like code
Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()

" clang-format - enable auto-formatting on save for C and java files
autocmd FileType c,cpp,java ClangFormatAutoEnable

let g:clang_format#detect_style_file = 1 " Find and use .clang-format file
let g:clang_format#style_options = { "BasedOnStyle" : "google" } " Default style

" Coc extensions
call coc#add_extension('coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-python', 'coc-prettier', 'coc-yaml')
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion (Don't add newline when accepting completion)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" color theme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italicize_strings=1
let g:gruvbox_italicize_comments=1
colorscheme gruvbox

" vim-airline/vim-airline plugin
let g:airline#extensions#tabline#enabled = 1

" pangloss/vim-javascript plugin
let g:javascript_plugin_jsdoc = 1

set nocompatible
syntax on
filetype plugin on

set shell=bash
set autochdir "Change current working dir to dir of file

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright

set encoding=utf8   " Set utf8 as standard encoding and en_US as the standard language
set number
set relativenumber
set backspace=indent,eol,start  " Make backspace work
set whichwrap=b,s,<,>,[,] " Be able to go to next/prev line with left/right arrow keys
"set cursorline " Marks current line TODO: some chars dont get correct bgcolor

set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=2    "Indent by 2 spaces when using >>, <<, == etc.
set softtabstop=2   "Indent by 2 spaces when pressing <TAB>

set autoindent     "Keep indentation from previous line
"set smartindent     "Automatically inserts indentation in some cases
"set cindent        "Like smartindent, but stricter and more customisable
set hlsearch        "Highlight search

set termguicolors   " enable true colors support

" groff files automatically detected
autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff

" Enable autocompletion:
"set wildmode=longest,list,full
"set wildmenu

" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

"lf.vim
let g:lf_map_keys = 0
let g:lf_replace_netrw = 1
"let g:lf_command_override = 'lf -command "set nopreview; set ratios 1; set hidden"'
nnoremap <C-n> :Lf<CR>

" Opens CTRLP Buffer chooser dialog
nmap <C-space> :CtrlPBuffer<CR>

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif

" Not sure what these do but probably Ctrl+s to save
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>

" F3 to toggle line-numbering
nmap <F3> :set invnumber invrelativenumber<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
