# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#  print a funny message ^_^ ,  and center it on screen...  
#   
#       > yum install fortune
#       > yum install cowsay
#

# fortune | cowsay -W 70 -f ghostbusters | sed 's/^./            \0/g'
fortune | cowsay -W 65 | sed 's/^./        \0/g'

echo ""


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

export EDITOR=vi
export SVN_EDITOR=vi
export JAVA_HOME=/usr/java/default

# http://help.github.com/set-your-user-name-email-and-github-token/
# export GIT_AUTHOR_NAME="David Lam"
# export GIT_AUTHOR_EMAIL="d@dlam.me"
# export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
# export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

alias xclip='xclip -selection cliboard'
alias free='free -m'
alias ls='ls -G'
alias grep='grep -n'
alias vi='mvim -v'
alias vim='mvim -v'

gitshow() { git show $1 | vi - ;}
gitdiff() { git diff $1 | vi - ;}
gitblame() { git blame $1 $2 | vi - ;}
gitlog() { git log --stat | vi - ;}

PS1="[\u@\h:\w] $ "


# alias screen=~/src/screen/src/screen

alias cvsstatus='cvs status 2>&1 | egrep "(^\? |Status: )" | grep -v Up-to-date'

PATH=$PATH:/usr/local/mysql/bin

