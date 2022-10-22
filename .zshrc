export ZSH="$HOME/.oh-my-zsh"
export EDITOR='vim'

ZSH_THEME="robbyrussell"

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin

plugins=(git vi-mode tmux fzf fzf-zsh-plugin zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

[ -s "~/.zshrc_private" ] && source ~/.zshrc_private

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

alias cat="bat --theme=Nord"
alias ls="exa --icons"

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
