#!/usr/bin/env bash

PROGNAME=${0##*/}
VERSION="0.1"

origin=https://github.com/lua/lua
branch=master
dir=origin

fetch_origin() {
    git clone --depth 1 ${origin} ${dir}
    mkdir ${dir}/src ${dir}/include
    mv ${dir}/*.h include/.
    mv ${dir}/*.c src/.

    return
}

clean_up() { # Perform pre-exit housekeeping
    rm -rf ${dir}
    return
}

error_exit() {
    echo -e "${PROGNAME}: ${1:-"Unknown Error"}" >&2
    clean_up
    exit 1
}

graceful_exit() {
    clean_up
    exit
}

signal_exit() { # Handle trapped signals
    case $1 in
    INT)
        error_exit "Program interrupted by user"
        ;;
    TERM)
        echo -e "\n$PROGNAME: Program terminated" >&2
        graceful_exit
        ;;
    *)
        error_exit "$PROGNAME: Terminating on unknown signal"
        ;;
    esac
}

usage() {
    echo -e "Usage: $PROGNAME [-h|--help] [-o|--origin] [-b|--branch]"
}

help_message() {
    cat <<-_EOF_
		  $PROGNAME ver. $VERSION

		  Fetch from lua origin and auto arrange files

		  $(usage)

		  Options:
		  -h, --help  Display this help message and exit.
		  -o, --origin  Origin to fetch
		  -b, --branch  Branch to fetch

	_EOF_
    return
}

# Trap signals
trap "signal_exit TERM" TERM HUP
trap "signal_exit INT" INT

# Parse command-line
while [[ -n $1 ]]; do
    case $1 in
    -h | --help)
        help_message
        graceful_exit
        ;;
    -o | --origin)
        origin=$2
        echo "Fetch from $origin"
        ;;
    -b | --branch)
        branch=$2
        echo "On branch $branch"
        ;;
    -* | --*)
        usage
        error_exit "Unknown option $1"
        ;;
    *) ;;

    esac
    shift
done

# Main logic

fetch_origin

graceful_exit
