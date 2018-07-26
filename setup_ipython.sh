if [ ! -f $HOME/.ipython/profile_default/startup/ipython_startup.py ]; then
  echo ipython_startup does not exist in $HOME/.ipython/profile_default/startup... symlinking it now
  ln -s $PWD/ipython_startup.py $HOME/.ipython/profile_default/startup/ipython_startup.py
else
  echo ipython_startup already exists in $HOME/.ipython/profile_default/startup
fi

if [ ! -f ~/.ipython/profile_default/ipython_config.py ]; then
  ipython profile create
fi

if grep -Fxqf $PWD/ipython_config.py ~/.ipython/profile_default/ipython_config.py; then
  echo ipython_config already configured
else
  cat $PWD/ipython_config.py >> ~/.ipython/profile_default/ipython_config.py
fi
