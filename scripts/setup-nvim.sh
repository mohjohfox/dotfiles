#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
config_source="$repo_root/.config/nvim"
config_target="$HOME/.config/nvim"

if [ -e "$config_target" ] && [ ! -L "$config_target" ]; then
  echo "Error: $config_target exists and is not a symlink. Move it out of the way before running this script." >&2
  exit 1
fi

mkdir -p "$(dirname "$config_target")"
ln -sfn "$config_source" "$config_target"

if command -v devbox >/dev/null 2>&1; then
  devbox global install
else
  echo "Warning: devbox not found. Install devbox or ensure dependencies are available on PATH." >&2
fi

if command -v nvim >/dev/null 2>&1; then
  nvim --headless "+Lazy! sync" +qa
  nvim --headless "+MasonToolsInstall" +qa
else
  echo "Warning: nvim not found. Install Neovim and re-run this script." >&2
fi
