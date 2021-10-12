#!/bin/bash

log_msg() {
    if [[ $# -lt 2 ]]
    then
        echo -e "\e[31m[ERROR]\e[0m Call to \`log_msg\` with $# arguments, expected at least 2." > /dev/stderr
        exit 1
    fi

    case $1 in
        INFO)
            echo -e "\e[32m[INFO]\e[0m ${@:2}"
            ;;
        WARNING)
            echo -e "\e[33m[WARNING]\e[0m ${@:2}"
            ;;
        ERROR)
            echo -e "\e[31m[ERROR]\e[0m ${@:2}" > /dev/stderr
            ;;
        INPUT)
            echo -n "${@:2}"
            ;;
        *)
            echo -e "[$1] ${@:2}"
            ;;
    esac
}
