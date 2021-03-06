# TODO  checkout...
#         - `htop`
#         - `mtop`
#         - `bpython`
#         - `tree`
#

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
        if [ "$HOSTNAME" = "xotic" ]; then
            # fortune | cowsay -W 70 -f ghostbusters | sed 's/^./            \0/g'
            fortune | cowsay -W 65 | sed 's/^./        \0/g'
            echo ""
        fi
    fi
fi

# https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="[\u@\H:\w]\[\033[33m\]\$(parse_git_branch)\[\033[00m $ "

PATH=$PATH:/usr/local/mysql/bin:/usr/lib/postgresql/9.3/bin/:/home/dlam/jdk1.8.0_111/bin:/usr/share/elasticsearch/bin/

export EDITOR=vi
export SVN_EDITOR=vi

# make ~/.bash_history moar readable   http://askubuntu.com/questions/391082/how-to-see-time-stamps-in-bash-history
export HISTTIMEFORMAT="%d/%m/%y %T "

alias free='free -m'
alias grep='grep -n -I --color=auto'
alias gi='grep -i'
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
alias gd='git diff '
alias gdd='gitdiff .'
alias gdv='git diff | vi -'
alias gdc='git diff --cached "$1"'
alias gdcv='git diff --cached "$1" | vi -'
alias gfp='git fetch --all; git pull'
alias gitlog='git log --stat'
alias gl=gitlog
alias gls=gitlog
alias glse='git log --stat > ENTIRE_GIT_LOG'
alias gm='git merge'
alias gpr='git pull --recurse-submodules'
alias gs='git status'
alias gsm='git submodule'
alias gsw='git show'
alias ga='git add -v'
alias gb='git branch'
alias g='git'
alias gitlogall='git log --branches --remotes --tags --graph --oneline --decorate'

# mercurial shortcuts
hgs() { hg status ;}
hgdiff() { hg diff "$1" | vi - ;}
hglog() { hg log | less ;}

# could also use... `grep -r foo .`
function findrecursive() { find . -type f -exec grep -nH $1 {} \;; }
function findrecursivel() { find . -type f -exec grep -l $1 {} \;; }
function dieallpycfiles() { find . -name "*.pyc" -exec rm -rf {} \;; }  # find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf 

# `date` in PST always, useful if on SSH'ed on a server that's using UTC!
function datepst { export TZ=America/Los_Angeles; date; unset TZ ;}

latest() { local file latest; for file in "${1:-.}"/*; do [[ $file -nt $latest ]] && latest=$file; done; printf '%s\n' "$latest"; } ## Usage: latest [dir]

alias cvsstatus='cvs status 2>&1 | egrep "(^\? |Status: )" | grep -v Up-to-date'
alias topcpu='top -o cpu -O +rsize -s 5 -n 30'
alias findr='findrecursive'
alias findrl='findrecursivel'
alias formatjson='cat $1 | python -m json.tool'
alias sa='source activate'
alias ms='python manage.py shell_plus'
alias tas="tmux attach-session"
alias tls="tmux list-sessions"
alias fn="find -name "
alias topmem='top -o -RSIZE'    # top sorted by memory usage
alias usd='unset DJANGO_SETTINGS_MODULE;  echo "...unset DJANGO_SETTINGS_MODULE!"'


# http://www.if-not-true-then-false.com/2010/linux-get-ip-address/
function external-ip () { lynx --dump http://ipecho.net/plain; }


# synclient FingerLow=15      #  touchpad pressure settings
# synclient FingerHigh=32     #  30 was lil too sensitive
# synclient MinSpeed=0.5
# synclient MaxSpeed=2
# # synclient AccelFactor=0.04
# # synclient AccelFactor=0.06    # a lil too fast
# synclient AccelFactor=0.0514403
#
# #  http://askubuntu.com/questions/218233/how-can-i-prevent-my-cursor-from-moving-when-i-am-clicking-the-trackpad/405998#405998
# synclient HorizHysteresis=40 VertHysteresis=40


#  from  https://github.com/creationix/nvm ...and this command:
#  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
