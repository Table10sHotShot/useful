plugins=(git z zsh-autosuggestions zsh-syntax-highlighting colored-man-pages)

#Note that . does the same thing as "source"
#Load bash aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

#Load bash functions
if [ -f $HOME/.bash_functions ]; then
    . $HOME/.bash_functions
fi

#Add home bin
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'
