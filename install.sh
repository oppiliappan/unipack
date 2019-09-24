#! /usr/bin/env bash

# setup
mkdir -p "$HOME/bin"
mkdir -p "$HOME/unipack"

# fetch
if hash wget > /dev/null; then
    wget -q "https://github.com/nerdypepper/unipack/tarball/master" -O "$HOME/unipack.tar"
elif hash curl > /dev/null; then
    curl -sL "https://github.com/nerdypepper/unipack/tarball/master" -o "$HOME/unipack.tar"
else
    echo "Could not find curl or wget"
    exit 1
fi

# unpack
tar xzf "$HOME/unipack.tar" -C "$HOME/unipack" --strip-components 1
mv "$HOME/unipack/unipack.sh" "$HOME/bin/unipack"

# install
echo 'export PATH=$PATH":$HOME/bin"' >> "$HOME/.bashrc"

# cleanup
rm "$HOME/unipack.tar"
rm -rf "$HOME/unipack"
