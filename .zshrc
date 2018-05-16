#Note that . does the same thing as "source"
#Load bash aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

#Load bash functions
if [ -f $HOME/.bash_functions ]; then
    . $HOME/.bash_functions
fi
