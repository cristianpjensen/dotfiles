syntax on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark

" let g:dracula_italic = 0

try
  colorscheme spaceduck
  " colorscheme dracula
catch
  echo 'colorscheme did not set'
endtry
