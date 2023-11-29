# My GNU/Linux config

I'm using [GNU Stow](https://www.gnu.org/software/stow/) to easily manage my config. And it's the reason the filepaths on this repository looks weird. You can take a look at Stow's [documentation](https://www.gnu.org/software/stow/manual/) for more information

## Prerequisites

Make sure you have installed `git` and `stow`

## Installing

1. Clone into your `$HOME`
2. Run `stow` inside the cloned directory

```
stow *  # For everything
```

```
stow */  # Only the directories
```

```
stow <file_name>  # For a especific file
```
