#===== alias =====
alias vi=vim
alias profile='vim ~/.bash_profile'
alias remind='vim ~/remind.txt'
alias ch="open -a ~/Applications/Google\ Chrome.app"
alias chrome="open -a ~/Applications/Google\ Chrome.app"
#===== ~ alias =====

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
