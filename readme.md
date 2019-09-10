# unipack

shell script to manage vim plugins in an env with only coreutils
and `vim` < 7.1, aka my uni.

unlike other package managers, you interact with `unipack`
from the command line, and not from inside vim. possibly
because the author does not know vimscript.

### installation

```shell
# no git, remember?
curl -sL https://github.com/nerdypepper/unipack/tarball/master | tar xzf
mkdir -p "$HOME/bin"
mv unipack/unipack.sh $HOME/bin/
```

### usage

`$HOME/.unipack.conf`:
```
temp="$HOME/temp"            # temp dir for unipack to work with
pack_dir="$HOME/.vim/plugin" # location for plugins to be installed to
```

`$HOME/.uniplugins`:
```
# one line per plugin 
# <- comments not allowed
nerdypepper/agila.vim
nerdypepper/vim-colors-plain
tpope/vim-repeat
```

`update`:
```shell
# updates plugins (or) installs all plugins listed in `.uniplugins`
unipack update
```

`install <plugin>`: 
```shell
unipack install tpope/vim-surround
```

`remove <plugin`:
```shell
unipack remove tpope/vim-surround
```
