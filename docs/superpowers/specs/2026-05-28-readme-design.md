# README Design

## Goal

Add a README.md to the chezmoi dotfiles repo. Primary audience is the owner (bootstrapping a new machine); secondary audience is anyone who clones or references it.

## Deliverables

1. `README.md` at repo root
2. `run_once_install-deps.sh.tmpl` — installs tool dependencies on first `chezmoi apply`

## README Sections

### What's managed
Brief list of managed tools: zsh, aliases, nvim, tmux, ghostty, alacritty, starship, git, gnome settings (Linux only).

### Prerequisites
Install chezmoi on a fresh machine:
```sh
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### Quick start
Single command to clone, apply, and trigger the install script:
```sh
chezmoi init --apply git@github.com:cosmicaislop/dot-files.git
```
Note: interactive prompt asks if it's a work machine. `y` = macOS (gnome files skipped), `n` = Linux (full setup including gnome restore).

### Platform notes
- **macOS (work):** gnome configs and themes are ignored via `.chezmoiignore`
- **Linux (personal):** `restore-gnome-settings.sh` runs once on first apply

## Install Script (`run_once_install-deps.sh.tmpl`)

Runs once on `chezmoi apply`. Uses chezmoi template conditionals to branch by platform:

- **macOS (`{{ if .work }}`):** `brew install neovim tmux starship ghostty`
- **Linux (`{{ else }}`):** `dnf install neovim tmux starship ghostty` + flatpak for alacritty if not available via dnf

Alacritty: available via `brew` on macOS; on Linux install via package manager or flatpak.

## Out of scope
- Per-tool configuration notes
- Troubleshooting section
- CI or automated testing
