#!/usr/bin.env bash
#
# Usage:
# Description:
# Examples:
# Options:
# ENV VARS:
#
# Author:
# Version:
# License:

# Derived from: https://www.nicksantamaria.net/post/boilerplate-bash-script/

set -e
set -o pipefail
set -u
IFS=$'\n\t'

echoerr() { printf "%s\n" "$*" >&2 ; }
info()    { echoerr "[INFO]    $*" ; }
warning() { echoerr "[WARNING] $*" ; }
error()   { echoerr "[ERROR]   $*" ; }
fatal()   { echoerr "[FATAL]   $*" ; exit 1 ; }

cleanup() {
    # Remove temporary files
    # Restart services
    info "... cleaned up"
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
  trap cleanup EXIT
  # Script goes here
  info "starting script ..."
fi
