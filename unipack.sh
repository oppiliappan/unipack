#! /usr/bin/env bash

source "$HOME/.unipack.conf"

install() {
    mkdir -p $temp
    mkdir -p $pack_dir
    while IFS= read -r line; do
        local pack_name="$(basename $line)"
        local url="https://github.com/$line/tarball/master"
        curl -L "$url" -o "$temp/$pack_name.tar"
        mkdir -p "$pack_dir/$pack_name"
        tar xzf "$temp/$pack_name.tar" -C "$pack_dir/$pack_name" \
            --strip-components 1
        rm -rf "$temp"
    done < "$HOME/.uniplugins"
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


