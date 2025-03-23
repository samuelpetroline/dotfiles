# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

. /opt/homebrew/opt/asdf/libexec/asdf.sh
export ANDROID_HOME=~/Library/Android/sdk 
export PATH=$PATH:$HOME/flutter/bin:$HOME/flutter/.pub-cache/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$HOME/.deno/bin
# $ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

function gad() {
    git add --all
}

function glg() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

function gps() {
  git push
}


function gpl() {
  git pull
}

function gcp() {
  git commit -m "$1"
  git push
}

function gc() {
  git commit -m "$1"
}

function gswc() {
  git switch -c "$1"
}

function gsw() {
  git switch "$1"
}

function adm() {
    sqitch add $1 -n "$2"
}

function gdev() {
    git checkout dev
    git pull
}

function gsdev() {
    git stash
    git checkout dev
    git pull
    git stash pop
}

function gmas() {
    git stash
    git checkout master
    git pull
}

function grel() {
    git stash
    git checkout dev
    git pull
    git checkout master
    git pull
    git rebase dev master
    git push -f
}

function gsend() {
	git stash
	git checkout dev
	git push origin dev:main
}

function gcf() {
    git add .
    git commit -a -m "$1"
    git push -f
}

function gfp() {
    git push -f
}

function grb {
    git fetch
    git rebase origin/dev
}

function gsq {
    git rebase -i $1
}

function gco {
    git checkout "$1"
}

function gstat {
    git status
}

function gdif {
    git diff
}

function gundo {
  git reset --soft HEAD@{1}
}

function his() {
  atuin search -i
}

function ide() {
  tmux new-window -n tmux-ide
  tmux split-window -v -l 30%
  tmux split-window -h -l 66%
  tmux split-window -h -l 50%
}

function cl() {
  clear
}

export PATH=$PATH:$HOME/.maestro/bin
export PATH=$PATH:$HOME/opt/homebrew/bin/elixir

alias vim="nvim"
alias air='$(go env GOPATH)/bin/air'

eval "$(atuin init zsh)"

# pnpm
export PNPM_HOME="/Users/samuelpetroline/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(zoxide init zsh)"export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export PATH="/Users/samuelpetroline/.local/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
