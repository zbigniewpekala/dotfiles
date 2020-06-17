let $VIM     = expand('~/.config/nvim/')
let $BUNDLES = expand($VIM . 'bundles/')

call plug#begin($BUNDLES)

Plug 'Shougo/denite.nvim'
Plug 'chriskempson/base16-vim'
Plug 'elixir-editors/vim-elixir', {'for': ['eelixir', 'elixir']}
Plug 'iCyMind/NeoSolarized'
Plug 'janko-m/vim-test'
Plug 'jgdavey/tslime.vim'
Plug 'jreybert/vimagit'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mcchrish/nnn.vim'
Plug 'mhinz/vim-mix-format', {'for': ['eelixir', 'elixir']}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'qpkorr/vim-bufkill'
Plug 'rafi/vim-denite-z'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-erlang/vim-erlang-compiler', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-omnicomplete', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-runtime', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-tags', {'for': 'erlang'}

call plug#end()

" general
let mapleader=" "

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set colorcolumn=80
" end of general

" colors
set background=dark
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme NeoSolarized
" end of colors

" mappings
nmap <S-j> <C-w><C-j>
nmap <S-k> <C-w><C-k>
nmap <S-l> <C-w><C-l>
nmap <S-h> <C-w><C-h>

nmap <leader>l :noh<CR>
nmap <leader>nt :NERDTree<CR>
nmap <leader>ntc :NERDTreeClose<CR>
nmap <leader>tn :TestNearest<CR>
nmap <leader>fmt :normal gg=G<CR>

nmap <leader>z :Denite z<CR>
nmap <leader>bf :Denite buffer<CR>
nmap <leader>k :Denite file/rec<CR>
nmap <leader>g :Denite grep<CR>
nmap <leader>cg :DeniteCursorWord grep:.<CR>
" end of mappings

let g:gist_post_private = 1 " gist-vim
let g:dispatch_compilers = {'mix test': 'exunit'} " vim-test
let test#strategy = 'tslime'

" denite
call denite#custom#var('file/rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '--ignore', '.git', '-g', ''])

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
endfunction

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'None')
call denite#custom#var('grep', 'default_opts',
\ ['--follow', '--nogroup', '--smart-case', '--hidden', '--nocolor'])
" end of denite

" coq
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap g? <Plug>(coc-diagnostic-info) 

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" end of coq
