# https://qiita.com/scalper/items/ed83c24f568cbf7f132b
## zplug
source ~/.zplug/init.zsh
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zaw'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug check || zplug install

#===== command modify =====
alias less='less -R'
#grep:行番号表示、色付け
alias grep="grep -G "
function ggrep(){
   \grep -nr -G "${1}" *
}
#grep:バイナリを弾く
alias grepnb='grep -nr -G -I -E "[0-9]{3}-[0-9]{4}-[0-9]{3}" '
#===== ~ alias =====

#===== git tig =====
alias   gk='cat ~/.gitconfig'
alias    t='tig'
alias   ts='tig status'
alias tigs='tig status'
alias  tbl='tig blame'
alias   gk='cat ~/.gitconfig'
alias    g='git'
alias   gb='git branch'
alias  gba='git branch --all'
alias   gc='git checkout'
alias  gcb='git checkout -b'
alias  gcm='git checkout master'
alias gcoa='git commit --amend'
alias  gms='git merge --squash'
alias  gri='git rebase -i'
alias  grp='git remote prune origin'
alias  gst='git stash'
alias gstp='git stash pop'
alias   gp='git pull'
alias gpod='git pull origin develop'
alias   gf='git fetch'
alias   gs='git status'
alias  gbl='tig blame'
alias   gg='git grep -nI --color'
#===== ~ git tig =====

#===== fast alias =====
alias  c='cd'
alias  d='cd'
alias  p='pwd'
alias  v='vim'
alias  s='source ~/.zshrc'
alias  l='ls -lah -G'
alias la='ls -lah -G'
alias ltr='ls -ltrh -G'
alias be='bundle exec'
alias ber='bundle exec ruby'
function ff(){
  find . -name "*${1}*"
}
#===== ~ fast alias =====

#===== basic =====
#bindkey -v # viins キーマップを選択
bindkey -e

# http://kronus9.sblo.jp/article/70293394.html
fpath=(/usr/local/share/zsh-completions $fpath)
export LANG=ja_JP.UTF-8
autoload -Uz compinit
compinit
#===== ~ basic =====

#===== prompt =====
autoload colors
colors

PROMPT="%{${fg[yellow]}%}%~%{${reset_color}%}
[%n]$ "
PROMPT2='[%n]> '
#===== ~ prompt =====


#===== peco =====
hash peco 2>/dev/null;
if [ "$?" -ne 0 ]; then
  BIN_DIR=~/bin
  alias peco='$BIN_DIR/peco_linux_amd64/peco'
fi

# http://k0kubun.hatenablog.com/entry/2014/07/06/033336
function peco-select-history() {
    BUFFER=$(fc -l -r -n 1 | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-select-history
bindkey '^r' peco-select-history

alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'

function peco-find-file() {
    if git rev-parse 2> /dev/null; then
        source_files=$(git ls-files)
    else
        source_files=$(find . -type f)
    fi
    selected_files=$(echo $source_files | peco --prompt "[find file]")

    BUFFER="${BUFFER}${echo $selected_files | tr '\n' ' '}"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-find-file
bindkey '^q' peco-find-file
#===== ~ peco =====

#===== ical =====
alias  ical='osascript -l JavaScript ~/bin/scripts/ical.scpt'
#===== ~ ical =====

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


#===== zsh設定 =====
# 変数の結果を置換して得られた文字を、ファイル拡張やファイル名生成として扱う
setopt GLOB_SUBST
#===== ~zsh設定 =====


#===== misc =====
#texのパス
#export PATH=$PATH:~/bin:/usr/texbin
# export PATH=$PATH:/Applications/UpTeX.app/teTeX/bin

# 画像をグレイスケール化
# function gray(){
# 	convert $1 \( +clone -alpha opaque -fill white -colorize 100% \) +swap -geometry +0+0 -compose Over -composite -alpha off -type GrayScale $1
# }
#===== ~ misc =====

#===== pyenv =====
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
#===== ~ pyenv =====

# rbenvのリハッシュ
eval "$(rbenv init -)"

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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
