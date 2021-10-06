# Personal Configuration Files

This repo contains a collection of configuration files and installation scripts for my personal GNU/Linux workflow.

## Usage 

Dotfiles are managed using [GNU Stow](https://www.gnu.org/software/stow/), this way config files are stored once, and then are symlinked to necessary directories inside `$HOME` folder.

To do so, this repo needs to be cloned in `$HOME`. In order to create the symlinks, just run:

```bash
$ stow <FOLDER>
```

Where `<FOLDER>` is one of the top level folders in this repo (e.g: general, tmux, ...).
