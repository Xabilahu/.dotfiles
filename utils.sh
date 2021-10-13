#!/bin/bash

# First param specifies log level
# If last param is equal to SAME-LINE, 
#   the logging will be done in the previous line 
# Every other parameter contain the message to log
log_msg() {
    if [[ $# -lt 2 ]]
    then
        echo -e "\e[31m[ERROR]\e[0m Call to \`log_msg\` with $# arguments, expected at least 2." > /dev/stderr
        exit 1
    fi
    
    msg="${@:2}"
    if [[ "${@: -1}" == "SAME-LINE" ]]
    then
        echo -en "\r\e[K"
        msg="${@:2:$#-2}"
    fi

    case $1 in
        INFO)
            echo -e "\e[32m[INFO]\e[0m $msg"
            ;;
        WARNING)
            echo -e "\e[33m[WARNING]\e[0m $msg"
            ;;
        ERROR)
            echo -e "\e[31m[ERROR]\e[0m $msg" > /dev/stderr
            ;;
        INPUT)
            echo -n "$msg"
            ;;
        *)
            echo -e "[$1] $msg"
            ;;
    esac
}
