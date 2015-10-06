BIN_DIR=~/bin
PECO_FILE=peco_linux_amd64.tar.gz

# 各ファイル展開
make deploy

# vim準備
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# peco
mkdir -p $BIN_DIR
cd $BIN_DIR
wget https://github.com/peco/peco/releases/download/v0.3.4/peco_linux_amd64.tar.gz -O $PECO_FILE
tar xvzf $PECO_FILE
\rm $PECO_FILE

# ディレクトリ色変更
sed -re 's/(DIR\s+01;)34/\135/g' /etc/DIR_COLORS > ~/.dir_colors
