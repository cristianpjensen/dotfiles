#!/usr/bin/python3

import os
import shutil
import subprocess
import errno

DOTDIR = os.getcwd()
HOME = os.getenv('HOME')


def main():

    ### BACKUP

    backup = False

    if input('Backup your current dotfiles? [y/n]\n') == 'y':
        # remove if the dir exists
        if os.path.isdir(HOME + '/dot-backup'):
            shutil.rmtree(HOME + '/dot-backup')

        os.mkdir(HOME + '/dot-backup')
        backup = True

    ### HOMEBREW

    if input('Install homebrew? [y/n]\n') == 'y':
        # install homebrew
        if subprocess.run(['brew', 'help']).returncode == 1:
            subprocess.run(
                '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"',
                shell=True)

        # install brew formulae
        subprocess.run([
            'brew', 'bundle', 'install',
            '--file=' + DOTDIR + '/homebrew/Brewfile'
        ],
                       cwd=HOME)

        if input('Install git config? [y/n]\n') == 'y':
            symlink(DOTDIR + '/git/gitconfig', HOME + '/.gitconfig', backup)

    ### ZSH

    if input('Install and use zsh config? [y/n]\n') == 'y':
        if not os.path.isdir(HOME + '/.zinit'):
            os.mkdir(HOME + '/.zinit')

        subprocess.run(
            ['git', 'clone', 'https://github.com/zdharma/zinit.git .zinit/bin'],
            cwd=HOME)
        symlink(DOTDIR + '/zsh/zshrc', HOME + '/.zshrc', backup)
        symlink(DOTDIR + '/zsh/p10k.zsh', HOME + '/.p10k.zsh', backup)

    ### NEOVIM

    if input('Install neovim? [y/n]\n') == 'y':
        # install vim-plug
        subprocess.run([
            'sh', '-c',
            'curl -fLo "${XDG_DATA_HOME:-./local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        ],
                       cwd=HOME)

        # symlink config
        symlink(DOTDIR + '/neovim/init.vim', HOME + '/.config/nvim/init.vim',
                backup)
        symlink(DOTDIR + '/neovim/config', HOME + '/.config/nvim/config',
                backup)

        # install config
        subprocess.run(['nvim', '+PlugInstall', '+qall'])

    ### ZATHURA

    if input('Install zathura? [y/n]\n') == 'y':
        symlink(DOTDIR + '/zathura/zathurarc',
                HOME + '/.config/zathura/zathurarc', backup)


def symlink(src, dst, backup):
    """
    Backup and then symlink.
    """

    if backup and os.path.exists(dst):
        if os.path.isdir(dst):
            dir_backup = dst.split('/')[-1]
            shutil.copytree(dst, HOME + '/dot-backup/' + dir_backup)
            print(dst, HOME + '/dot-backup/' + dir_backup)
        else:
            shutil.copy2(dst, HOME + '/dot-backup')

    try:
        os.symlink(src, dst)
    except OSError:
        os.remove(dst)
        os.symlink(src, dst)


if __name__ == '__main__':
    main()
