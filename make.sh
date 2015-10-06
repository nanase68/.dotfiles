BIN_DIR=~/bin

# vim準備
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# peco
mkdir -p $BIN_DIR
wget https://github.com/peco/peco/releases/download/v0.3.4/peco_linux_amd64.tar.gz -P $BIN_DIR
tar xvzf $BIN_DIR/peco_linux_386.tar.gz -C $BIN_DIR

# ディレクトリ色変更
sed -re 's/(DIR\s+01;)34/\135/g' /etc/DIR_COLORS > ~/.dir_colors
