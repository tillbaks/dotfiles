" Install vim-plug if not existent
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS
call plug#begin()
Plug 'tpope/vim-fugitive' " GIT Stuff
Plug 'morhetz/gruvbox' " Color scheme
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim' " Ctrl-space and ctrl-n
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rbgrouleff/bclose.vim' "lf.vim dependency
Plug 'ptzz/lf.vim' " Ctrl-f
Plug 'sheerun/vim-polyglot' " Programming language support
Plug 'rhysd/vim-clang-format' " Format C-like code
Plug 'TaDaa/vimade' " Fades out inactive panes
"Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
call plug#end()

" Split navigation
nnoremap <A-Down> <C-W><C-J>
nnoremap <A-Up> <C-W><C-K>
nnoremap <A-Right> <C-W><C-L>
nnoremap <A-Left> <C-W><C-H>
" Create splits
nnoremap <A-s> <C-W><C-S>
nnoremap <A-v> <C-W><C-v>
" Resize splits
nnoremap <A-S-Down> <C-W>-
nnoremap <A-S-Up> <C-W>+
nnoremap <A-S-Right> <C-W>>
nnoremap <A-S-Left> <C-W><

" Inactive fading settings
let g:vimade = {}
let g:vimade.fadelevel = 0.7
let g:vimade.enablesigns = 1

" clang-format - enable auto-formatting on save for C and java files
autocmd FileType c,cpp,java ClangFormatAutoEnable

let g:clang_format#detect_style_file = 1 " Find and use .clang-format file
let g:clang_format#style_options = { "BasedOnStyle" : "google" } " Default style

" Coc extensions
"
call coc#add_extension('coc-tsserver', 'coc-json', 'coc-html', 'coc-css', 'coc-python', 'coc-prettier', 'coc-yaml', 'coc-svelte', 'coc-snippets', 'coc-pairs', 'https://github.com/fivethree-team/vscode-svelte-snippets', 'https://github.com/nathanchapman/vscode-javascript-snippets')
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion (Don't add newline when accepting completion)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" color theme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_italicize_strings=1
let g:gruvbox_italicize_comments=1
colorscheme gruvbox

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
nnoremap <C-f> :Lf<CR>

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

" Some remapping
nnoremap <BS> X
nnoremap <Tab> >>
nnoremap <S-Tab> <<

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)

" Opens FZF Buffer chooser dialog
nmap <C-space> :Buffers<CR>
" Opens FZF Git Files dialog
nmap <C-n> :GitFiles --exclude-standard --others --cached<CR>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" :Files previews
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

set hidden
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

set showtabline=0   " disable top bar with open buffers
let g:bufferline_active_buffer_left = '[ '
let g:bufferline_active_buffer_right = ']'
let g:bufferline_show_bufnr = 0

" Copy (in visual mode) to clipboard using ctrl-c
vnoremap <C-c> "+y
" Paste from clipboard using ctrl-v
map <C-v> "+p
