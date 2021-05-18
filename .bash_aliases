# system aliases
alias cp='cp -i'
alias groupsp='groups | sed "s/ /\n    /g"'
alias ls='ls -G'
alias l='ls -GCF'
alias ll='ls -Gl'
alias lla='ls -Gla'
alias mv='mv -i'
alias o='open'
alias r='reset'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# git aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# tmux aliases
alias tko='tmux kill-session -t'
