if status is-interactive
    # Commands to run in interactive sessions can go here
    # eval (zellij setup --generate-auto-start fish | string collect)
    # eval (bash $CFG_PATH/fish/functions/zellijList.bash)
end

if test -d /opt/homebrew/opt/ruby/bin
    set -x PATH /opt/homebrew/opt/ruby/bin $PATH
    set -x PATH (gem environment gemdir)/bin $PATH
end

if test -d /opt/homebrew/opt/ruby/bin
    set -x PATH /opt/homebrew/opt/ruby/bin $PATH
    set -x PATH (gem environment gemdir)/bin $PATH
end


# http_proxy set
# export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

set -gx XDG_RUNTIME_DIR /tmp

eval "$(pyenv init --path)"

# alias nvim="$HOME/nvim-macos/bin/nvim"
# alias vim="$HOME/nvim-macos/bin/nvim"

# vim & nvim alias
# alias vim="/usr/local/bin/nvim"
alias v="nvim $argv"
# alias vim="/usr/local/bin/nvim"
# alias v="/usr/local/bin/nvim"
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"



# crazy fish
# alias fish='rlwrap fish'

# disable welcome message
set -U fish_greeting ""

# theme
# set -g theme_color_scheme terminal-dark
# set -g fish_prompt_pwd_dir_length 1
# set -g theme_display_user yes
# set -g theme_hide_hostname no
# set -g theme_hostname no

# theme enhanced
# set -g fish_color_error yellow
# set -g fish_color_command "f0f0f0"
# set -g fish_color_autosuggestion yellow

# Rosé theme
# fish_config theme choose "Rosé Pine"
# fish_config theme choose "Rosé Pine Moon"


# onedark theme
if status is-interactive
    set -l onedark_options -b

    if set -q VIM
        # Using from vim/neovim.
        set onedark_options -256
    else if string match -iq "eterm*" $TERM
        # Using from emacs.
        function fish_title
            true
        end
        set onedark_options -256
    end

    set_onedark $onedark_options
end



# set bin path
set -gx EDITOR nvim
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH ~/.bun/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# set config path (macos)
set -gx CFG_PATH ~/.config

# nvm
# set -x PATH (brew --prefix nvm)/bin $PATH
# source (brew --prefix nvm)/nvm.fish
# pyenv
set -x PATH (pyenv root)/shims $PATH


# fist pane run start
# sencond pane run lazy git
# third pane run ohter
# alias ide='source ~/.config/fish/functions/ide.bash'
# alias project='source $CFG_PATH/fish/functions/project.bash'

# open my zellij layout
# alias zl='bash $CFG_PATH/fish/functions/zellijList.bash'
alias zl='peco_select_zellij'

# close all zellij session
alias za="zellij da -y"

# run zellij command
alias zrf="zellij run --"
alias zrs="zellij run --direction down --"

# restart zellij layout
alias zr="za ; zl"

# lazygit 
alias lg='lazygit'


if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
    alias ls exa
end

alias gln='git log --name-only'

# Attaches tmux to the last session; creates a new session if none exists.
# alias t='tmux attach || tmux new-session'
# Attaches tmux to a session (example: ta portal)
# alias ta='tmux attach -t'
# Creates a new session
# alias tn='tmux new-session'
# Lists all ongoing sessions
# alias tl='tmux list-sessions'
# kill all server 
# alias tkill='tmux kill-server'

# clear all message
alias cl='clear'

starship init fish | source

command clear
# set --export BUN_INSTALL "$HOME/.bun"
# set --export PATH $BUN_INSTALL/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wiizard/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/wiizard/Downloads/google-cloud-sdk/path.fish.inc'
end
