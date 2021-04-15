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

filetype off
au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.typescriptreact

" change cursor shape between insert and normal mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
