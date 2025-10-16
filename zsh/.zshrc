plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

function gad() {
    git add --all
}

function glg() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

function gps() {
  git push
}

function gpsu() {
  BRANCH=$(git branch --show-current)
  git push --set-upstream origin $BRANCH
}

function gpsf() {
  git push --force
}

function gbc() {
  git branch --show-current
}

function grbsprd() {
  MAIN=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
  BRANCH=$(git branch --show-current)
  git switch $MAIN 
  git pull
  git switch $BRANCH
  git rebase $MAIN
}

function grbc() {
  git rebase --continue
}

function grba() {
  git rebase --abort
}

function grbs() {
    git rebase -i $1
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

function gswp() {
  gsw "$1"
  gpl
}

function gsw() {
  git switch "$1"
}

function gswmain() {
  MAIN=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
  git switch $MAIN
  git pull
}

function gfp() {
    git push -f
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

function killport() {
  kill $(lsof -i :$1)
}

alias vim="nvim"
alias lzg="lazygit"
alias lzd='lazydocker'
alias tm='task-master'
alias taskmaster='task-master'

eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"

