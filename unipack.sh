#! /usr/bin/env bash

source "$HOME/.unipack.conf"

fetch() {
    # setup
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

install() {
    fetch $1
    echo $1 >> "$HOME/.uniplugins"
    sed -i -e '/^$/d' "$HOME/.uniplugins"
}

update() {
    while IFS= read -r line; do
        if [ ! -e "$pack_dir/$line" ]; then
            fetch $line
        fi
    done < "$HOME/.uniplugins"
}

remove() {
    local target="$1"
    local pack_name="$( basename $target )"
    sed -i -e "\;$target;d" "$HOME/.uniplugins"
    rm -rf "$pack_dir/$pack_name"
    echo "Removing ... $1"
}

get_help() {
    echo "Unipack - Akshay Oppiliappan <nerdypepper@tuta.io>"
    echo
    echo "Usage:"
    echo "unipack"
    echo "     .. install author/plugin     to install a plugin"
    echo "     .. remove  author/plugin     to remove a plugin"
    echo "     .. update                    to update all plugins"
}

case $1 in
    i|install)
        install
        ;;
    r|remove)


