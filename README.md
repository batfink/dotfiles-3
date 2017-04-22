# .files

Install dotfiles
```
git clone https://github.com/geekjuice/dotfiles.git .dotfiles
./.dotfiles/install.sh
```

Install `snazzy`
```
curl -OSL https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/master/Snazzy.itermcolors
open Snazzy.itermcolors
rm -rf Snazzy.itermcolors
```

Install `homebrew`
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install `brew` packages
```
brew install ag fzf git httpie hub jq reattach-to-user-namespace tmux vim z zsh
```

Install `brew cask` packages
```
brew cask install hammerspoon spotify
```

Install `tpm`
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install `antibody`
```
curl -sL https://git.io/antibody | bash -s
```

Install Powerline fonts
```
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts
```
