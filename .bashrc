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

# User specific aliases and functions

export EDITOR=vi
export SVN_EDITOR=vi
export JAVA_HOME=/usr/java/default
export DEPLOY_USER=dlam

# http://help.github.com/set-your-user-name-email-and-github-token/
# export GIT_AUTHOR_NAME="David Lam"
# export GIT_AUTHOR_EMAIL="d@dlam.me"
# export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
# export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

alias free='free -m'
alias grep='grep -n'
alias diff='diff -u'

if [[ "$OSTYPE" =~ ^darwin ]]; then 
    # MacOSX
    alias vi='mvim -v'   # use MacVim
    alias vim='mvim -v'
    alias ls='ls -G'
else
    # Fedora 
    alias vi='vim'
    alias ls='ls --color'
    alias xclip='xclip -selection cliboard'   # `pbcopy` on mac
fi

# git shortcuts
gitshow() { git show "$1" | vi - ;}
gitdiff() { git diff "$1" | vi - ;}
gitblame() { git blame $1 $2 | vi - ;}
gitlog() { git log --stat "$1" | vi - ;}

# could also use... `grep -r foo .`
function findrecursive() { find . -type f -exec grep -nH $1 {} \;; }
function findrecursivel() { find . -type f -exec grep -l $1 {} \;; }
alias findr='findrecursive'
alias findrl='findrecursivel'


PS1="[\u@\h:\w] $ "


# alias screen=~/src/screen/src/screen

alias cvsstatus='cvs status 2>&1 | egrep "(^\? |Status: )" | grep -v Up-to-date'

PATH=$PATH:/usr/local/mysql/bin

