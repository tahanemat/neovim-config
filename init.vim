call plug#begin('~/.config/nvim/plugged-t')

Plug 'neoclide/coc.nvim'
Plug 'dikiaap/minimalist'
Plug 'wadackel/vim-dogrun'
Plug 'preservim/nerdtree'
Plug 'tbastos/vim-lua'
Plug 'neoclide/coc-highlight'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bfrg/vim-cpp-modern'
Plug 'jiangmiao/auto-pairs'

call plug#end()

set number relativenumber
syntax on
colorscheme minimalist
set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noswapfile
set pumheight=10
set termguicolors

let g:cpp_class_scope_highlight = 1
let c_no_curly_error = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1

let NERDTreeMouseMode = 2

augroup MouseInNERDTreeOnly
	autocmd!
	autocmd BufEnter NERD_tree_* set mouse=a
	autocmd BufLeave NERD_tree_* set mouse=
augroup END
set mouse=

highlight Comment cterm=italic
highlight Statement cterm=italic
highlight cppStructure cterm=italic ctermfg=215 guifg=#FFAF5F
highlight Pmenu ctermbg=57 guibg=#272540


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

