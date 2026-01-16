# dotfiles

Personal configuration files for neovim, tmux, devbox.

## Structure

- `.tmux.conf`
- `.zshrc`
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

3) Start your tools:

- `nvim`
- `tmux`
