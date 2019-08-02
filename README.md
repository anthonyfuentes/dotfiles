# dotfiles
Version control repo for my configuration files. 

## Why 
* Switching to a new development environment is much faster
* Test configurations without worrying about undoing the changes
* Prevent data loss

## Guide
*  [The best way to store your dotfiles](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

## Quick Setup
1. Execute the code found in the [setup_local_configs](https://gist.github.com/anthonyfuentes/17b77f4f313fc1330b27f9d5c9ef409f) script
    1. In order for the .bash_profile to affect the parent shell, execute the script like so `$ . ./<script name> <repo URL>`
    2. To clone a specific branch, execute `$ . ./<script name> <repo URL> <branch name>`
