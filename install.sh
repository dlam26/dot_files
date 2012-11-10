#installs dot_files stuff to $HOME !

FILES="bashrc gitignore hgrc screenrc tmux.conf vimrc"
DOT_FILES=~/dot_files

for file in $FILES; do
    ln -ifsv $DOT_FILES/.$file ~/.$file
done

# update keys file
cp -v $DOT_FILES/.ssh/authorized_keys ~/.ssh/
