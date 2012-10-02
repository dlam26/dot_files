#installs dot_files stuff to $HOME !

FILES="bashrc gitignore hgrc screenrc tmux.conf vimrc"
DOT_FILES=~/dot_files

ln -ifsv $HOME/.hgrc $DOT_FILES/.hgrc

for file in $FILES; do
    ln -ifsv $DOT_FILES/.$file ~/.$file
done
