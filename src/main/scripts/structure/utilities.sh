
function COL {
    text=$1
    color=$2
    echo -en "\e[0;${color}m${text}\e[0;37m\e[0m"
}


