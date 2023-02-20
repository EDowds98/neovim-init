syntax on
set number
set expandtab
""colorscheme peachpuff
set ts=4 sw=4
set showmatch

" stops weird indenting on lisp files
autocmd FileType lisp let b:did_indent = 1
autocmd FileType lisp setlocal indentexpr=

" plugins
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'vlime/vlime', {'rtp': 'vim/'}  
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Shortcut to toggle NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>`

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" autocomplete braces, quotations etc
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" for coc
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


let g:coc_disable_startup_warning = 1
