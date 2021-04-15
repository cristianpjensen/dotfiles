## Zsh

Install [zinit](https://github.com/zdharma/zinit) by using
```
mkdir ~/.zinit
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
```

Symlink the zsh configuration and p10k configuration (replace the `...` with the
directory where `dotfiles` is located):
```
ln -nfs ~/.../dotfiles/zsh/zshrc ~/.zshrc
ln -nfs ~/.../dotfiles/zsh/p10k.zsh ~/.p10k.zsh
```

I recommend running `p10k configure` to configure the theme of your terminal
using [powerlevel10k](https://github.com/romkatv/powerlevel10k).

List of aliases:
|Alias|Command|Usage|
|-----|-------|-----|
|`ls` |`ls -FG`|Better `ls`|
|`l.` |`ls -dahG .*`|List of all dotfiles in current directory|
|`pip`|`pip3`|Removes the need for the `3` at the end of `pip`|
|`python`|`python3`|Removes the need for the `3` at the end of `python`|

Furthermore, I added confirmation to `rm`, `cp`, and `mv`.
