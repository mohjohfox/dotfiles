# Repository Guidelines

## Project Structure & Module Organization
This repo is a small set of personal dotfiles. Key files live at the root and are intended to be symlinked into `$HOME`.

- `.tmux.conf`: tmux configuration.
- `.zshrc`: zsh shell configuration and aliases.
- `.local/share/devbox/global/default/`: devbox global config (`devbox.json`, `devbox.lock`).

There is no application source tree or test suite; changes are typically direct edits to these config files.

## Build, Test, and Development Commands
There is no build or test pipeline. Local setup is done by linking files into your home directory:

- `stow -t ~ .` (preferred): symlinks all tracked dotfiles into `$HOME`.
- `ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf` (manual): link individual files as needed.

## Coding Style & Naming Conventions
Keep configs tidy and consistent:

- Use 2-space indentation where applicable (shell files, JSON).
- Prefer lowercase file names and standard dotfile names (e.g., `.zshrc`, `.tmux.conf`).
- Keep sections grouped with short comment headers only when helpful.

## Testing Guidelines
No automated tests are used. Validate changes manually:

- Open a new terminal session for `.zshrc` changes.
- Restart tmux or reload with `tmux source-file ~/.tmux.conf`.
- Run `devbox` to ensure `devbox.json` and `devbox.lock` are in sync.

## Commit & Pull Request Guidelines
Commit history uses short, imperative messages like `add aliases` or `add wezterm config`. Follow that style:

- `add <feature>`
- `update <area>`
- `fix <behavior>`

Pull requests should include:

- A short description of the change and why it is needed.
- Any manual verification steps (e.g., “opened new shell session”).

## Security & Configuration Tips
Avoid adding secrets (tokens, passwords) to tracked files. If a secret is required, document how to set it via environment variables instead of committing it.
