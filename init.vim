call plug#begin('~/.config/nvim/plugged-t')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'preservim/nerdcommenter'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bfrg/vim-cpp-modern'
Plug 'mhinz/vim-signify'
Plug 'xiyaowong/nvim-transparent', {'branch': 'main'}
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
Plug 'cdelledonne/vim-cmake'
call plug#end()

set clipboard=unnamedplus
set termguicolors
set signcolumn = relativenumber number
syntax on
set hidden
set tabstop=2
set showtabline=2
set expandtab
set pumheight=15
set cmdheight=1
filetype plugin on
set updatetime=100

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1

let g:transparent_enabled = v:true

set background=dark
colorscheme challenger_deep

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" CMake commands

nmap <leader>zg <Plug>(CMakeGenerate)
nmap <leader>zz <Plug>(CMakeBuild)
nmap <leader>zZ <Plug>(CMakeBuildTarget)
nmap <leader>zs <Plug>(CMakeSwitch)
nmap <leader>zD :call <SID>Clean_build_files()<CR>
nmap <leader>za <Plug>(CMakeOpen)
nmap <leader>zq <Plug>(CMakeClose)

function! s:Clean_build_files()
        :echom "Cleaning build files..."
        :CMakeClean
        :echom "Cleaned build!"
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Toggle between transparency modes
map <leader>ts :TransparentToggle<CR>

highlight Comment cterm=italic gui=italic
highlight Statement cterm=italic gui=italic
highlight cppStructure cterm=italic gui=italic ctermfg=215 guifg=#FFAF5F
highlight Pmenu ctermbg=57 guibg=#272540
highlight CocHighlightText guibg=#333347

"highlight Normal guibg=None
"highlight LineNr guibg=None
"highlight NonText guibg=None guifg=None

let g:signify_sign_show_text = 1

highlight SignifySignAdd    ctermfg=black ctermbg=green  guifg=#000000 guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#7400e0
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

xmap <leader>f :pyf /usr/share/clang/clang-format.py<cr>
nmap <leader>f :pyf /usr/share/clang/clang-format.py<cr>

function! Formatonsave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp,*.hpp call Formatonsave()
