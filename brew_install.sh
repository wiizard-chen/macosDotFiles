# install font
brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono-nerd-font && brew install --cask font-fira-code-nerd-font

brew install git
brew install nvim

# install shell
brew install fish
which fish | sudo tee -a /etc/shells
chsh -s $(which fish)
brew install starship
fisher install jethrokuan/z
fisher install jorgebucaran/nvm.fish

# install shell tools
brew install peco
brew install ripgrep
brew install eza
brew install delta
brew install zellij
brew install lazygit
brew install git-delta
brew install jq
brew install pyenv

# install window manager
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# install lts versrion
nvm install lts
