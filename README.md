# dotfiles

Personal configuration files for Neovim, tmux, devbox.

## Structure

- `.tmux.conf`
- `.zshrc`
- `.config/nvim` (kickstart.nvim-based config)
- `.local/share/devbox/global/default/devbox.json`
- `.local/share/devbox/global/default/devbox.lock`

## Setup on a new machine

1) Install git and clone this repo:

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
```

2) Link the configs into your home directory.

Option A: use `stow` (clean and reversible):

```bash
# install stow if you do not have it yet
# macOS: brew install stow
# Linux: your package manager

stow -t ~ .
```

Option B: manual symlinks:

```bash
ln -s ~/dotfiles/.local/share/devbox/global/default/devbox.json ~/.local/share/devbox/global/default/devbox.json
ln -s ~/dotfiles/.local/share/devbox/global/default/devbox.lock ~/.local/share/devbox/global/default/devbox.lock
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

3) Install devbox packages (idempotent):

```bash
devbox global install
```

4) Start your tools:

- `nvim`
- `tmux`

## Neovim setup

This repo uses the upstream `kickstart.nvim` configuration as a starting point. Plugins are managed by `lazy.nvim`, and language tooling is managed by `mason.nvim` via `mason-tool-installer`.

### One-shot, idempotent setup

```bash
./scripts/setup-nvim.sh
```

This script:
- Ensures `~/.config/nvim` points at this repo (fails fast if it would overwrite a real directory).
- Installs devbox packages (`devbox global install`).
- Runs headless Neovim to sync plugins and install Mason tools.

### Manual setup

1) Link the config:

```bash
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

2) Install devbox packages:

```bash
devbox global install
```

3) Open Neovim once to let `lazy.nvim` install plugins automatically, then install Mason tools:

```bash
nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonToolsInstall" +qa
```

### Notes

- Telescope search features work best with `ripgrep` and `fd` (installed via devbox).
- Treesitter and some plugins may require a C compiler and `make` (installed via devbox).
