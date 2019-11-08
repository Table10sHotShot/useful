Extra instructions to succesfully setup a mac (to be run after `setup`).

### Update highlighting style

```bash
echo ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=\'fg=60\' >> $ZSH_CUSTOM/zsh-autosuggestions_custom.zsh
```

### Install powerline fonts

```bash
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
```

Open ITerm2 > Preferences > Profiles > Text > Change Font
Choose "Meslo LG DZ for Powerline"

### Change color theme

iTerm2 > Preferences > Profile > Colors > Color Presets
Choose "Solarized Dark"

### Tabs in full screen

iTerm2 > View > Show Tabs in Fullscreen

### Clipboard access

iTerm2 > General > Selection > Applications in terminal may access clipboard

### Autoquit MacVim on :q

MacVim > Preferences > After last window closes: > Quit MacVim

### Install ports

sudo port install git-lfs htop ImageMagick inetutils iperf3 neovim rsync tmux trash wget
