#! /usr/bin/env bash

# setup
mkdir -p "$HOME/bin"
mkdir -p "$HOME/unipack"

# fetch
curl -sL "https://github.com/nerdypepper/unipack/tarball/master" -o "$HOME/unipack.tar"

# unpack
tar xzf "$HOME/unipack.tar" -C "$HOME/unipack" --strip-components 1
mv "$HOME/unipack/unipack.sh" "$HOME/bin/unipack"

# install
echo 'export PATH=$PATH":$HOME/bin"' >> "$HOME/.bashrc"

# cleanup
rm "$HOME/unipack.tar"
rm -rf "$HOME/unipack"
