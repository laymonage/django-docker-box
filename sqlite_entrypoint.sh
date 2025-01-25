#!/usr/bin/env bash

set -e
# IFS=$'\n\t'

if compgen -G "/sqlite/sqlite-autoconf-3470200.tar.gz" > /dev/null; then
    mkdir -p /tmp/sqlite
    tar -xzvf /sqlite/sqlite-autoconf-3470200.tar.gz -C /tmp/sqlite
    pushd /tmp/sqlite/sqlite-autoconf-3470200
    ./configure
    make
    cd .libs
    export LD_LIBRARY_PATH=$(pwd)
    popd
fi
exec $@
