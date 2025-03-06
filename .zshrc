# Path to your oh-my-zsh installation.
export PATH=$PATH:$HOME/bin
export ZSH="$HOME/.oh-my-zsh"
export JAVA_HOME=$(/usr/libexec/java_home -v 21)
export DAILY_PATH="~/git/docs/daily/scripts/daily"
export LANG=en_US.UTF-8
export BAT_THEME="TwoDark"

# Installed through brew:
#
# bat colordiff docker docker-completion fzf jq kubernetes-cli maven minikube
# mongosh mysql neovim node openjdk parallel ripgrep spring-boot tldr
# zoxide font-fira-code-nerd-font font-fira-mono-nerd-font iterm2


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git vi-mode zsh-autosuggestions colored-man-pages zsh-syntax-highlighting)
VI_MODE_DISABLE_CLIPBOARD=true
# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 29
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

source $ZSH/oh-my-zsh.sh

# aliases
alias daily="sh $DAILY_PATH"
alias vi="nvim"
alias fgb='git checkout $(git branch -a | sed "/\*/d" | sed "/->/d" | fzf --height=~50% | sed "s/.*origin\//  /")'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
