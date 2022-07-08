" source modular configs
source $HOME/.config/nvim/plugs.vim
""""""""""""""""""""""""

set clipboard=unnamedplus
set termguicolors
set noshowmode
set signcolumn=auto
set relativenumber number
syntax on
set hidden
set tabstop=8 
set softtabstop=0 
set shiftwidth=2 
set smarttab
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

let g:transparent_enabled = v:false

set background=dark
"colorscheme challenger_deep
colorscheme kanagawa

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

nmap <silent> <C-n> <cmd> NvimTreeToggle<CR>
nmap <silent> <C-m> <cmd> MinimapToggle<CR>
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <A-[> <Plug>(coc-diagnostic-prev)
nmap <silent> <A-]> <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting all code.
xmap <leader>ff  <Plug>(coc-format)
nmap <leader>ff  <Plug>(coc-format)
" Formatting selected code.
xmap <silent> <C-i> <Plug>(coc-format-selected)
nmap <leader> <C-i> <Plug>(coc-format-selected)

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
let g:semshi#mark_selected_nodes = 0

highlight SignifySignAdd    ctermfg=black ctermbg=green  guifg=#000000 guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#7400e0
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

xmap <leader>fc :pyf /usr/share/clang/clang-format.py<cr>
nmap <leader>fc :pyf /usr/share/clang/clang-format.py<cr>

autocmd BufWritePre *.h,*.cc,*.cpp,*.hpp call CocActionAsync('format')

" source modular configs
lua require('init')
""""""""""""""""""""""""

