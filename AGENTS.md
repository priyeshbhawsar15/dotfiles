# Repository Guidelines

## Project Structure & Module Organization

This repository stores personal dotfiles as GNU Stow packages. Each top-level package mirrors the target home-directory layout:

- `nvim/.config/nvim/` contains the LazyVim-based Neovim configuration, Lua entrypoint, lockfile, and Stylua settings.
- `tmux/.config/tmux/` contains `tmux.conf` and tmux plugin configuration.
- `starship/.config/starship.toml` configures the shell prompt.
- `zsh/.zshrc` configures the interactive shell and must stay portable across Homebrew and non-Homebrew systems.
- `setup.sh` automates dependency installation.
- `README.md` documents manual setup and Stow usage.

Add new dotfile packages as top-level directories that can be installed with `stow <package>`.

## Build, Test, and Development Commands

- `chmod +x setup.sh && ./setup.sh`: install dependencies. Review the script before running because it uses `sudo`, downloads releases, removes apt-managed duplicates, and changes user-level tooling.
- `stow nvim starship tmux zsh`: symlink the current packages into `$HOME`.
- `stow -nvt ~ nvim`: dry-run a Stow package and inspect links before applying changes.
- `stow -D <package>`: remove symlinks for one package.
- `nvim --headless "+Lazy! sync" +qa`: verify Neovim plugins can synchronize in a noninteractive session.

## Coding Style & Naming Conventions

Keep shell scripts POSIX/Bash-readable with clear command grouping and quoted variables where paths may contain spaces. Use two-space indentation in shell conditionals and loops unless an existing file uses another local style. Format Lua files with the repository Neovim Stylua config at `nvim/.config/nvim/stylua.toml`; prefer snake_case for Lua locals and descriptive plugin/module names. Keep package directory names lowercase and aligned with the tool they configure, such as `tmux` or `starship`.

Keep shell startup files portable. Guard Homebrew, generated profile snippets, and `/opt` tool paths with existence checks so the same `zsh/.zshrc` works on non-Debian or non-Homebrew machines.

## Testing Guidelines

There is no formal test suite. Validate changes with targeted checks: run `stow -nvt ~ <package>` for link safety, `bash -n setup.sh` after editing the installer, `tmux source-file tmux/.config/tmux/tmux.conf` after tmux changes, and `nvim --headless "+checkhealth" +qa` when practical for Neovim updates. For configuration files, prefer a dry run or parser check before committing.

## Commit & Pull Request Guidelines

Recent commits use short, imperative summaries such as `update script`, `readme update for script`, and `lazygit`. Keep subjects concise and focused on one change. Pull requests should describe the affected package, list validation commands run, and call out system-impacting changes such as new `sudo` usage, shell defaults, downloaded binaries, or Stow package additions.

## Security & Configuration Tips

Do not commit secrets, machine-specific tokens, or private host paths. Treat installer edits carefully: prefer official release URLs, avoid destructive cleanup outside known temporary paths, and document any new external dependency in `README.md`.
