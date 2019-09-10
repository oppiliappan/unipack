#! /usr/bin/env bash

source "$HOME/.unipack.conf"

install() {
    mkdir -p $temp
    mkdir -p $pack_dir
    local pack_name="$(basename $1)"
    local url="https://github.com/$1/tarball/master"

    # download
    echo "Installing ... $1"
    curl -sL "$url" -o "$temp/$pack_name.tar"

    # unpack
    mkdir -p "$pack_dir/$pack_name"
    tar xzf "$temp/$pack_name.tar" -C "$pack_dir/$pack_name" \
        --strip-components 1

    # cleanup
    rm -rf "$temp"
}

update() {

}

remove() {
    local target="$1"
    local pack_name="$( basename $target )"
    sed -i -e "\;$target;d" "$HOME/.uniplugins"
    rm -rf "$pack_dir/$pack_name"
}

case $1 in
    i|install)
        install
        ;;
    r|remove)


