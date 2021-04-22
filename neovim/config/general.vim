set shell=/bin/zsh
set nonumber! norelativenumber!
set cursorline!

set ttyfast
set list listchars=tab:»\ ,trail:·

" indenting
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

" linebreaks
set linebreak
set showbreak=↪
set textwidth=80

" spellcheck
augroup mdtexSpell
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType tex setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd BufRead,BufNewFile *.tex setlocal spell
augroup END

set spelllang=nl,en_gb

" correct spelling with Ctrl+l
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

filetype off
au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.typescriptreact
