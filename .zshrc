# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting colored-man-pages docker docker-compose copyfile copybuffer fzf)

export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [ `uname` = "Darwin" ]; then
    plugins+=(brew)
else
    plugins+=(debian)
fi

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

#Add opt local bin (this is where macports installs)
if [ -d /opt/local/bin ]; then
    export PATH=/opt/local/bin:$PATH
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

#Load extra local rc
if [ -f $HOME/.zshrc_extra ]; then
    source $HOME/.zshrc_extra
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
