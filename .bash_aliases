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
  if [ -f /opt/local/bin/mvim ]; then
    alias vim="/opt/local/bin/mvim"
  fi

  if [ ! -z `command -v trash` ]; then
    alias rm="trash"
  fi
fi
