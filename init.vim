call plug#begin('~/.config/nvim/plugged-t')

Plug 'neoclide/coc.nvim'
Plug 'dikiaap/minimalist'
Plug 'wadackel/vim-dogrun'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tbastos/vim-lua'
Plug 'neoclide/coc-highlight'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bfrg/vim-cpp-modern'
Plug 'jiangmiao/auto-pairs'
Plug 'APZelos/blamer.nvim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mhinz/vim-signify'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'

call plug#end()

set number relativenumber
syntax on
colorscheme minimalist
set hidden
set tabstop=2
set showtabline=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noswapfile
set pumheight=10
set termguicolors
set cmdheight=1
set noshowmode
set nomodeline
set updatetime=100
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2
set encoding=UTF-8
scriptencoding utf-8

let g:cpp_class_scope_highlight = 1
let c_no_curly_error = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1
let g:blamer_enabled = 1
let g:blamer_delay = 500

let g:lightline = {
      \ 'colorscheme': 'simpleblack',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': []
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
		  \ 'separator': { 'left': "\ue0b8", 'right': "\ue0b6" },
      \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0b7" },
      \ 'mode_map': { 'n': 'N', 'i': 'I', 'R': 'R', 'v': 'V', 'V':'V-Line', "\<C-v>": 'V-Block', 'c':'C', 's':'S', 'S':'S-Line', "\<C-s>": 'S-Block', 't':'T' }
      \ }

let NERDTreeMouseMode = 2

augroup MouseInNERDTreeOnly
	autocmd!
	autocmd BufEnter NERD_tree_* set mouse=a
	autocmd BufLeave NERD_tree_* set mouse=
augroup END
set mouse=

highlight Comment cterm=italic gui=italic
highlight Statement cterm=italic gui=italic
highlight cppStructure cterm=italic gui=italic ctermfg=215 guifg=#FFAF5F
highlight Pmenu ctermbg=57 guibg=#272540

highlight Normal guibg=Black 
highlight LineNr guibg=Black
highlight NonText guibg=None guifg=None

let g:signify_sign_show_text = 1

highlight SignifySignAdd    ctermfg=black ctermbg=green  guifg=#000000 guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#7400e0
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)
map <C-h> <Cmd>bprevious<CR>
map <C-l> <Cmd>bnext<CR>
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#filename_modifier = ':t'

