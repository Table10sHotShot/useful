alias sar="sudo service apache2 restart"
alias sv="sudo vim"
alias py="python3"
alias ipy="python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias pipin="python3 -m pip install --user"
alias pipun="python3 -m pip uninstall --user"

# Linux only

if [ ! -z `command -v apt-get` ]; then
  alias agu="sudo apt-get update"
  alias agU="sudo apt-get dist-upgrade"
  alias agi="sudo apt-get install"
fi

# Macs only

if [ -f /opt/local/bin/mvim ]; then
  alias vim="/opt/local/bin/mvim"
fi

if [ ! -z `command -v trash` ]; then
  alias rm="trash"
fi
