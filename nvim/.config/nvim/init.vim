let $VIM     = expand('~/.config/nvim/')
let $BUNDLES = expand($VIM . 'bundles/')

call plug#begin($BUNDLES)

Plug 'rbgrouleff/bclose.vim'
Plug 'mcchrish/nnn.vim'
Plug 'Shougo/denite.nvim'
Plug 'elixir-editors/vim-elixir'
Plug 'yuttie/comfortable-motion.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'scrooloose/nerdtree'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-fugitive'
Plug 'vim-erlang/vim-erlang-compiler', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-omnicomplete', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-runtime', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-tags', {'for': 'erlang'}

call plug#end()

let mapleader=" "

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap

let g:nnn#layout = { 'left': '~20%' }

nmap <leader>nt :NERDTree<CR>
nmap <leader>cnt :NERDTreeClose<CR>

nmap <leader>fmt :normal gg=G<CR>

call denite#custom#var('file/rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '--ignore', '.git', '-g', ''])

call denite#custom#map(
          \ 'insert',
          \ '<Down>',
          \ '<denite:move_to_next_line>',
          \ 'noremap'
          \)
    call denite#custom#map(
          \ 'insert',
          \ '<Up>',
          \ '<denite:move_to_previous_line>',
          \ 'noremap'
          \)

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'default_opts',
\ ['--follow', '--nogroup', '--smart-case', '--hidden'])

nmap <leader>bf :Denite buffer<CR>
nmap <leader>f :Denite file/rec<CR>
nmap <leader>g :Denite grep<CR>

nmap <S-j> <C-w><C-j>
nmap <S-k> <C-w><C-k>
nmap <S-l> <C-w><C-l>
nmap <S-h> <C-w><C-h>

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

let g:dispatch_compilers = {'mix test': 'exunit'}

set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
