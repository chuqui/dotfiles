export ZSH="$HOME/.oh-my-zsh"
export EDITOR='vim'

ZSH_THEME="robbyrussell"


# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin

plugins=(git vi-mode tmux fzf fzf-zsh-plugin zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

[ -s "~/.zshrc_private" ] && source ~/.zshrc_private

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
