
Setup:

git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
Add the following to .bashrc "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >>
$HOME/.bashrc

Sources:
https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
https://news.ycombinator.com/item?id=11071754
