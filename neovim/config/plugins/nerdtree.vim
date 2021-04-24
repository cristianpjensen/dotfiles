nnoremap <C-t> :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1

" start nerdtree when vim starts
autocmd VimEnter * NERDTree | wincmd p

" exit vim when nerdtree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" nerdtree git plugin
let g:nerdtreegitstatusindicatormapcustom = {
  \ 'modified':   'm',
  \ 'staged':     '+',
  \ 'untracked':  '-',
  \ 'renamed':    '>',
  \ 'unmerged':   '|',
  \ 'deleted':    'x',
  \ 'dirty':      '0',
  \ 'ignored':    '☒',
  \ 'clean':      '1',
  \ 'unknown':    '?',
  \ }
