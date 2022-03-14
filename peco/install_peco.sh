#!/usr/bin/env bash

if [ $(uname) != "Linux" ]; then
    exit 0
fi

# Usage: BINDIR=${HOME}/bin/ bash install_peco.sh
set -o xtrace       # for debug output.  ( abbr. set -x )
set -o errexit      # for exit on error. ( abbr. set -e )
set -o pipefail     # errexit for pipe
set -o nounset      # exit when the script to use undeclared variables (abbr. set -u)

mkdir -p ${HOME}/bin/

filename=peco_linux_amd64.tar.gz

latest_tag="$(curl -L --head https://github.com/peco/peco/releases/latest | grep -i location: | sed 's/^.*\/tag\/\([^\/]*\)\r$/\1/')"
uri_to_download="https://github.com/peco/peco/releases/download/${latest_tag}/${filename}"
bindir="${BINDIR:-"${HOME}/bin/"}"

pushd "$(mktemp -d "/tmp/tmp.XXXXXXXXXX")"
    curl -O -L "$uri_to_download"
    tar xf "$filename"
    cp "${filename%%.*}/peco" "$bindir"
popd

if [[ ! -x "${bindir}/peco" ]]; then
    echo '"peco" was not successfully installed!' >&2
    exit 2
fi
