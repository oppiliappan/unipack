# unipack

shell script to manage vim plugins in an env without `git`
and without `vim` >= 7.1, aka my uni.

### installation

manual

### usage

`$HOME/.unipack.conf`:
```
temp="$HOME/temp"
pack_dir="$HOME/.vim/plugin"  # any path that $VIMRUNTIME hits

```

`$HOME/.uniplugins`:
```
# one line per plugin 
# <- comments not allowed
nerdypepper/agila.vim
nerdypepper/vim-colors-plain

```
run `unipack -i` to install plugins and `unipack -r` to
remove them (re-reads `.unipack.conf` and removes them)
