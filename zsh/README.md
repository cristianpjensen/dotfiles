## Zsh

Install [zinit](https://github.com/zdharma/zinit) by using
```
mkdir ~/.zinit
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
```

Symlink the zsh configuration and p10k configuration
```
ln -nfs ~/dotfiles/zsh/zshrc ~/.zshrc
ln -nfs ~/dotfiles/zsh/p10k.zsh ~/.p10k.zsh
```

I recommend running `p10k configure` to configure the theme of your terminal
using [powerlevel10k](https://github.com/romkatv/powerlevel10k).
