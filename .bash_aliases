# this allows aliases to be used with sudo (ending space means next work checked against aliases)
alias sudo="sudo "
alias sar="sudo service apache2 restart"
alias sv="sudo vim"
alias py="python3"
alias ipy="python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias pyi="python3 -m ipdb"
alias pyic="python3 -m ipdb -c c"
alias pipin="python3 -m pip install --user"
alias pipun="python3 -m pip uninstall --user"
alias c="clear"
alias hp="history | peco"
alias lsp="ls | peco"
alias dk="docker"
alias dkc="docker-compose"

if [ `uname` = "Darwin" ]; then
    if [ ! -z `command -v nvim` ]; then
    alias vim="nvim"
  fi

  if [ ! -z `command -v trash` ]; then
    alias rm="trash"
  fi
fi

alias gpmr="gpsup -o merge_request.create"
alias gclb='git branch --merged | \grep -v master | >/tmp/merged-branches && vim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches'
alias gclbr="git branch -r --merged master | \grep -v master | sed 's/origin\///' > /tmp/merged-branches && vim /tmp/merged-branches && xargs -n 1 git push --delete origin </tmp/merged-branches"
alias gfap='git fetch --all --prune'
alias grho='git reset --hard origin/$(current_branch)'
alias glg='glol --branches'
alias gdm="gd master"
alias gl="glola --first-parent"

alias ls="exa"
alias ll="exa --long --header --git"
alias lst="exa --tree"

alias grep='echo \"Using grep is not recommended. Use rg instead. if you really want to use grep, prepend a backslash before the command to bypass this alias.\"; false'
alias find='echo \"Using find is not recommended. Use fd instead. if you really want to use find, prepend a backslash before the command to bypass this alias.\"; false'
alias du='echo \"Using du is not recommended. Use dust instead. if you really want to use du, prepend a backslash before the command to bypass this alias.\"; false'

alias cpf='copyfile'
