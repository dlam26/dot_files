# .bashrc
# TODO  checkout `htop`

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1="[\u@\h:\w] $ "
PATH=$PATH:/usr/local/mysql/bin:/Library/PostgreSQL/9.2/bin/

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
    alias grep='grep -n --color=auto'
fi

# git shortcuts
gitshow() { git show "$1" | vi - ;}
gitdiff() { git diff "$1" | vi - ;}
gitblame() { git blame $1 $2 | vi - ;}
gitlog() { git log --stat "$1" | vi - ;}
gs() { git status ;}
gl() { gitlog ;}

hgs() { hg status ;}
hgdiff() { hg diff "$1" | vi - ;}
hglog() { hg log | less ;}

# could also use... `grep -r foo .`
function findrecursive() { find . -type f -exec grep -nH $1 {} \;; }
function findrecursivel() { find . -type f -exec grep -l $1 {} \;; }
alias findr='findrecursive'
alias findrl='findrecursivel'

function dieallpycfiles() { find . -name "*.pyc" -exec rm -rf {} \;; }

# `date` in PST always, useful if on SSH'ed on a server that's using UTC!
function datepst { export TZ=America/Los_Angeles; date; unset TZ ;}


# alias screen=~/src/screen/src/screen

alias cvsstatus='cvs status 2>&1 | egrep "(^\? |Status: )" | grep -v Up-to-date'

alias usd='unset DJANGO_SETTINGS_MODULE;  echo "...unset DJANGO_SETTINGS_MODULE!"'
alias td='tail -f /tmp/django.log'


#  print a funny message ^_^ ,  and center it on screen...  
#   
#       > yum install fortune
#       > yum install cowsay
#
#  http://stackoverflow.com/questions/14495139/how-do-i-check-if-two-specific-programs-exist-on-a-system-in-an-if-conditional
if type fortune &> /dev/null; then
    if type cowsay &> /dev/null; then
        # fortune | cowsay -W 70 -f ghostbusters | sed 's/^./            \0/g'
        fortune | cowsay -W 65 | sed 's/^./        \0/g'
        echo ""
    fi
fi

alias v='vagrant'
