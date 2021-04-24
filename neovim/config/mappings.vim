" disable arrow keys
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" treat long lines as break lines
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" center screen when jumping
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

" U redos
nnoremap <silent> U :redo<CR>

" keep selecting after an indent operation
vnoremap <silent> > >gv|
vnoremap <silent> < <gv

" use <leader>/ to remove search highlights
nmap <silent> <leader>/ :nohlsearch<CR>

" perform macros on multiple lines
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
