# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Export ./bin to PATH
export PATH="$PATH:$HOME/.bin"

# Source general bash settings
if [ -f ~/.bash_general ]; then
    . ~/.bash_general
fi

# Source bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Source bash functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Source bash plugins
if [ -f ~/.bash_plugins ]; then
    . ~/.bash_plugins
fi
