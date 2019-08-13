# Amazon specific config

source /apollo/env/envImprovement/var/zshrc

export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short

for f in SDETools envImprovement AmazonAwsCli OdinTools; do
    if [[ -d /apollo/env/$f ]]; then
        export PATH=$PATH:/apollo/env/$f/bin
    fi
done

export AUTO_TITLE_SCREENS="NO"

# export PROMPT="
# %{$fg[white]%}(%D %*) <%?> [%~] $program %{$fg[default]%}
# %{$fg[cyan]%}%m %#%{$fg[default]%} "

# export RPROMPT=

set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

alias e=vim
alias bb=brazil-build

alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'

if [ -f ~/.zshrc-dev-dsk-post ]; then
    source ~/.zshrc-dev-dsk-post
fi

export PATH=$HOME/.toolbox/bin:$PATH



export PATH="/apollo/env/AmazonAwsCli/bin/:$PATH"

alias third-party-promote='~/.toolbox/bin/brazil-third-party-tool promote'
alias third-party='~/.toolbox/bin/brazil-third-party-tool'
alias vim='/apollo/env/envImprovement/bin/vim'

export CLOUDWATCH_CONSOLE_DIR="/home/miatelh/workplace/CloudWatchConsole/src"
export CLOUDWATCH_GWT_DIR="$CLOUDWATCH_CONSOLE_DIR/AWSConsole-CloudWatch-GWT"
export CLOUDWATCH_DASHBOARD_JS_DIR="$CLOUDWATCH_CONSOLE_DIR/CloudWatchDashboardsJS"

alias cw-build-gwt="cd $CLOUDWATCH_GWT_DIR && bb clean && bb"
alias cw-fast-build-deploy-gwt="cd $CLOUDWATCH_GWT_DIR && bb clean && bb server-dev"
alias cw-deploy-gwt="cd $CLOUDWATCH_GWT_DIR && bb server-dev"

alias cw-build-js-gwt="cd $CLOUDWATCH_CONSOLE_DIR/CloudWatchDashboardsJS-GWT && bb clean && bb"

alias cw-build-js="cd $CLOUDWATCH_DASHBOARD_JS_DIR && bb clean && bb"
alias cw-fast-build-js="cd $CLOUDWATCH_DASHBOARD_JS_DIR && bb clean && bb build && bb uglify"
alias cw-webpack-deploy-js="cd $CLOUDWATCH_DASHBOARD_JS_DIR && bb server-dev -hostname=miatelh.aka.corp.amazon.com;"

alias cw-fast-deploy="cw-fast-build-js && cw-build-js-gwt && cw-fast-build-deploy-gwt"
alias cw-build="cw-build-js && cw-build-js-gwt && cw-build-gwt && cw-deploy-gwt"

alias cw-mx-server-casper="cd $CLOUDWATCH_GWT_DIR/build/brazil-casper-tests/tst/casper/cloudwatch/ && mxServer"

alias brazil-octane="/apollo/env/OctaneBrazilTools/bin/brazil-octane"



# ===============================================
# Personal config

alias ranger="python ~/ranger/ranger.py"
# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=100000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history

	git config --global push.default current

# Aliases
	alias v="vim -p"
	mkdir -p /tmp/log
	
	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
	export VISUAL=vim

    source ~/dotfiles/zsh/plugins/fixls.zsh

#Functions
	# Loop a command and show the output in vim
	loop() {
		echo ":cq to quit\n" > /tmp/log/output 
		fc -ln -1 > /tmp/log/program
		while true; do
			cat /tmp/log/program >> /tmp/log/output ;
			$(cat /tmp/log/program) |& tee -a /tmp/log/output ;
			echo '\n' >> /tmp/log/output
			vim + /tmp/log/output || break;
			rm -rf /tmp/log/output
		done;
	}

 	# Custom cd
 	c() {
 		cd $1;
 		ls;
 	}
 	alias cd="c"

# For vim mappings: 
	stty -ixon

# Completions
# These are all the plugin options available: https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3/plugins
#
# Edit the array below, or relocate it to ~/.zshrc before anything is sourced
# For help create an issue at github.com/parth/dotfiles

autoload -U compinit

plugins=(
	docker
)

for plugin ($plugins); do
    fpath=(~/dotfiles/zsh/plugins/oh-my-zsh/plugins/$plugin $fpath)
done

compinit

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/prompt.sh
export PATH=$PATH:$HOME/dotfiles/utils

