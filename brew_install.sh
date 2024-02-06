brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono-nerd-font
brew install git
brew install nvim

brew install fish
which fish | sudo tee -a /etc/shells
chsh -s $(which fish)

brew install starship
fisher install jethrokuan/z
fisher install jorgebucaran/nvm.fish

brew install peco
brew install ripgrep
# brew install exa
brew install eza
brew install delta
brew install zellij
brew install lazygit
brew install pyenv
brew install git-delta
brew install koekeishiya/formulae/yabai

# yabai --start-service (M1)
brew install koekeishiya/formulae/skhd
brew services start skhd
brew install jq

# install lts versrion
nvm install lts 
