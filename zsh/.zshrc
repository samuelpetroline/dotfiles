plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

. /opt/homebrew/opt/asdf/libexec/asdf.sh

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

alias vim="nvim"

eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
