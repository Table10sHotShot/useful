export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting colored-man-pages)

source $ZSH/oh-my-zsh.sh

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

prompt_context(){}

#Load extra local rc
if [ -f $HOME/.zshrc_extra ]; then
    . $HOME/.zshrc_extra
fi
