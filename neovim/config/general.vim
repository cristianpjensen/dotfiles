" line numbering
set nonumber! norelativenumber!
set cursorline!

" search
set incsearch
set ignorecase
set smartcase

" indentation
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

" other
set shell=/bin/zsh
set list listchars=tab:»\ ,trail:·
set autowrite
set title
set titlestring=%t
set confirm
set history=5
set ve+=onemore
set backspace=indent,eol,start

filetype off

" needed for resizing windows with mouse
"set mouse=n
