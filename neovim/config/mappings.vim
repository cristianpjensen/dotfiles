" disable arrow keys
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" treat long lines as break lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" center screen when jumping
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz

" U redos
nnoremap U :redo<CR>

" keep selecting after an indent operation
vnoremap > >gv|
vnoremap < <gv

" perform macros on multiple lines
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
