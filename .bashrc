DARKGRAY='\e[1;30m'
LIGHTRED='\e[1;31m'
GREEN='\e[32m'
YELLOW='\e[1;33m'
LIGHTBLUE='\e[1;34m'
NC='\e[m'

PCT="\`if [[ \$EUID -eq 0 ]]; then T='$LIGHTRED' ; else T='$LIGHTBLUE'; fi; 
echo \$T \`"

#  For "literal" command substitution to be assigned to a variable,
#+ use escapes and double quotes:
#+       PCT="\` ... \`" . . .
#  Otherwise, the value of PCT variable is assigned only once,
#+ when the variable is exported/read from .bash_profile,
#+ and it will not change afterwards even if the user ID changes.


PS1="\n$GREEN[\w] \n$DARKGRAY($PCT\u$DARKGRAY)$YELLOW-> $NC"

#alias
alias ll='ls -l -G'
alias la='ls -al -G'
alias lm='ls -l -G | more'
alias mkdir='mkdir -p'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias which='type -a'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias gb='git branch'
alias gco='git checkout'
alias gdiff='git diff'
alias gst='git status'

#-------------------------------------------------------------
# File & string-related functions:
#-------------------------------------------------------------


# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ; }

# Find a pattern in a set of files and highlight them:
# (needs a recennnt version of egrep)
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
    xargs -0 egrep -sn ${case} "$1" 2>&- | more 

}

#-------------------------------------------------------------
# Process/system related functions:
#-------------------------------------------------------------


function myps() { ps $@ -u $USER -o pid,%cpu,%mem,time,command ; }
function pp() { myps -f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

#-------------------------------------------------------------
# Misc utilities:
#-------------------------------------------------------------

function repeat()       # Repeat n times command.
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}

#-------------------------------------------------------------
# Jar finder
#-------------------------------------------------------------
function searchClass()
{
    local fileList
    fileList=`find $1 -type f -iname *.jar`
    for afile in $fileList
    do
      echo Finding $afile
      jar tf $afile | grep $2
    done
}

if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi
