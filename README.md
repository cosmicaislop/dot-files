# dotfiles

Managed with [chezmoi](https://chezmoi.io).

## What's managed

- zsh + aliases
- neovim
- tmux
- ghostty
- alacritty
- starship
- git
- gnome settings and themes (Linux only)

## Prerequisites

Install chezmoi:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)"
```

## Quick start

```sh
chezmoi init --apply git@github.com:cosmicaislop/dot-files.git
```

You'll be prompted: **Is this a work machine?**
- `y` — macOS; gnome files are skipped
- `n` — Linux; full setup including gnome theme restore

Dependencies (neovim, tmux, starship, ghostty, alacritty) are installed automatically via `run_once_install-deps.sh`.

## Platform notes

**macOS:** gnome configs and the themes directory are excluded via `.chezmoiignore`.

**Linux (Fedora):** `restore-gnome-settings.sh` runs once on first apply to re-enable extensions and set the shell theme.
