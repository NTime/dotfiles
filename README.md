# My GNU/Linux config

This repository is structured to make use of [GNU Stow](https://www.gnu.org/software/stow/).

## Installing

You can either manually copy the files to their respective directories or use Stow for symlink management:

1. Make sure `stow` is installed. 
2. Run `stow` inside the cloned directory.

```sh
stow -t ~/ nvim/  # For Neovim configuration 
```

