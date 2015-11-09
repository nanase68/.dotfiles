#===== alias =====
alias vi=vim
alias profile='vim ~/.bash_profile'
alias remind='vim ~/remind.txt'
alias ch="open -a ~/Applications/Google\ Chrome.app"
alias chrome="open -a ~/Applications/Google\ Chrome.app"
#===== ~ alias =====

#===== git tig =====
alias    t='tig'
alias   ts='tig status'
alias tigs='tig status'
alias   gk='cat ~/.gitconfig'
alias    g='git'
alias   gb='git branch'
alias   gc='git checkout'
alias  gcb='git checkout -b'
alias  gcm='git checkout master'
alias  gms='git merge --squash'
alias  gri='git rebase -i'
alias   gp='git pull'
alias   gf='git fetch'
alias   gs='git status'
alias  gbl='git blame'
alias   gg='git grep'
#===== ~ git tig =====

#===== fast alias =====
alias la='ls -la'
alias ltr='ls -ltr'
alias s='source ~/.zshrc'
alias sz='source ~/.zshrc'
#===== ~ fast alias =====


#===== peco =====
BIN_DIR=~/bin
alias peco='$BIN_DIR/peco_linux_amd64/peco'

# http://wayohoo.com/unix/zsh-oh-my-zsh-peco-of-installation-procedure.html
# http://qiita.com/wada811/items/78b14181a4de0fd5b497
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | eval $tac | awk '!a[$0]++' | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    # zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
#===== ~ peco =====

#===== history =====
# http://qiita.com/syui/items/c1a1567b2b76051f50c4
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=10000000

# 重複を記録しない
setopt hist_ignore_dups

# historyを共有する
setopt share_history

# 開始と終了を記録
setopt EXTENDED_HISTORY
#===== ~history =====

#===== misc =====
#texのパス
#export PATH=$PATH:~/bin:/usr/texbin
export PATH=$PATH:/Applications/UpTeX.app/teTeX/bin

# 画像をグレイスケール化
function gray(){
	convert $1 \( +clone -alpha opaque -fill white -colorize 100% \) +swap -geometry +0+0 -compose Over -composite -alpha off -type GrayScale $1
}
#===== ~ misc =====

#===== rm =====
# rmをrmtrashに置き換える
alias rm='rmtrash'
#===== ~ rm =====

#===== grep =====
#grepが自動的に行番号表示と色付けを行うようにする
alias grep="grep -n --color=auto "

#grep バイナリを弾く
alias grepnb='grep -nr --color=auto -I -E "[0-9]{3}-[0-9]{4}-[0-9]{3}" '
#===== ~ grep =====
#

## tmux自動起動
# # http://d.hatena.ne.jp/tyru/20100828/run_tmux_or_screen_at_shell_startup
# is_screen_running() {
# # tscreen also uses this varariable.
# [ ! -z "$WINDOW" ]
# }
# is_tmux_runnning() {
# [ ! -z "$TMUX" ]
# }
# is_screen_or_tmux_running() {
# is_screen_running || is_tmux_runnning
# }
# shell_has_started_interactively() {
# [ ! -z "$PS1" ]
# }
# resolve_alias() {
# cmd="$1"
# while \
#    #whence "$cmd" >/dev/null 2>/dev/null \
#    #&& [ "$(whence "$cmd")" != "$cmd" ]
# do
# cmd=$(whence "$cmd")
# done
# echo "$cmd"
# }
#
#
# if ! is_screen_or_tmux_running && shell_has_started_interactively; then
# for cmd in tmux tscreen screen; do
# if whence $cmd >/dev/null 2>/dev/null; then
# $(resolve_alias "$cmd")
# break
# fi
# done
# fi
