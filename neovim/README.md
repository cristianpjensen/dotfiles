## Neovim

`brew install neovim`

To use plugins, install [`vim-plug`](https://github.com/junegunn/vim-plug):
```
sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

To use my configuration, symlink the config files to `~/.config/nvim/` (replace
the `...` with the directory where `dotfiles` is located):
```
ln -nfs ~/.../dotfiles/neovim/init.vim  ~/.config/nvim/init.vim
ln -nfs ~/.../dotfiles/neovim/config ~/.config/nvim
```

Afterward, install the plugins with `nvim +PlugInstall +qall`.

After installation, use neovim with `nvim`.

To make use of
[inkscape-figures](https://github.com/gillescastel/inkscape-figures) for tex
files, you have to run `inkscape-figures watch` before editing files. This can
be used by first typing the name of a figure and then pressing
<kbd>Ctrl+F</kbd>.

If you are running linux, you can also utilise
[inkscape-shortcut-manager](https://github.com/gillescastel/inkscape-shortcut-manager),
which provides a lot of shortcuts and vim integration for text editing. This
makes it a lot faster to make figures. It only works for linux.
