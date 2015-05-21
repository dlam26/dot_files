# TODO  checkout `htop` and `mtop`

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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
    fi
fi

echo ""
echo "  find your public IP:   curl ifconfig.me"
echo ""
echo "  'tree' is the best unix command, it shows a directory in a tree!"
echo ""
echo ""
echo "    Use bpython!  "
echo ""


PS1="[\u@\H:\w] $ "
PATH=$PATH:/usr/local/mysql/bin:/usr/lib/postgresql/9.3/bin/

export EDITOR=vi
export SVN_EDITOR=vi

alias free='free -m'
alias grep='grep -n -I --color=auto'
alias diff='diff -u'

if [[ "$OSTYPE" =~ ^darwin ]]; then 
    # MacOSX
    alias vi='mvim -v'   # use MacVim
    alias vim='mvim -v'
    alias ls='ls -G'
else
    # linux
    alias vi='vim'
    alias ls='ls --color'
    alias xclip='xclip -selection cliboard'   # `pbcopy` on mac
    alias open='gnome-open'
fi

### git shortcuts
# alias gitshow='git show "$1" | vi -'
gitshow() { git show "$1" | vi - ;}
# alias gitdiff='git diff "$1" | vi -'
gitdiff() { git diff "$1" | vi - ;}
alias gc='git checkout'
alias gca='git commit --amend'
alias gd=gitdiff
alias gdc='git diff --cached "$1" | vi -'
alias gitlog='git log --stat "$1"'
alias gl=gitlog
alias gls=gitlog
alias gs='git status'
alias gsw='git show'
alias ga='git add -v'
alias gb='git blame'
alias g='git'

alias topmem='top -o -RSIZE'    # top sorted by memory usage

# mercurial shortcuts
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

alias cvsstatus='cvs status 2>&1 | egrep "(^\? |Status: )" | grep -v Up-to-date'

alias usd='unset DJANGO_SETTINGS_MODULE;  echo "...unset DJANGO_SETTINGS_MODULE!"'
alias td='tail -f /tmp/django.log'
alias psrs='ps -Af | grep runserver'

alias v='vagrant'
alias vs='vagrant status'
alias vu='vagrant up'

alias topcpu='top -o cpu -O +rsize -s 5 -n 30'
alias psr='ps -Af | grep -i runserver'

# http://www.if-not-true-then-false.com/2010/linux-get-ip-address/
function external-ip () { lynx --dump http://ipecho.net/plain; }
 


synclient FingerLow=15      #  touchpad pressure settings
synclient FingerHigh=32     #  30 was lil too sensitive
synclient MinSpeed=0.5
synclient MaxSpeed=2
# synclient AccelFactor=0.04
# synclient AccelFactor=0.06    # a lil too fast
synclient AccelFactor=0.0514403

#  http://askubuntu.com/questions/218233/how-can-i-prevent-my-cursor-from-moving-when-i-am-clicking-the-trackpad/405998#405998
synclient HorizHysteresis=40 VertHysteresis=40
