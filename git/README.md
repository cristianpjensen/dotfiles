## Git

`brew install git`

To use my configuration, insert your information into the config file and
symlink the file to `~/.gitconfig`.
```
ln -nfs ~/dotfiles/git/gitconfig ~/.gitconfig
```

Take a look at the `gitconfig` file to see which commands you can use. Some are
listed below:

|Command|Usage|
|-------|-----|
|`git l`|Abbreviated history graph of the last 20 commits|
|`git s`|Short-formatted working tree status|
|`git d`|Show the diff between now and last commit|
|`git ca`|Commit all changes|
|`git go`|Switch to a branch, creating it if necessary|
|`git b`|View remote and local branches|
