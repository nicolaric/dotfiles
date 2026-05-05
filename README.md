# dotfiles

## Setup

These dotfiles are managed with [GNU Stow](https://www.gnu.org/software/stow/).
Install `stow` before linking configs into your home directory.

```sh
brew install stow
```

On Arch Linux:

```sh
sudo pacman -S stow
```

Each top-level directory is a Stow package. Files inside each package are laid out
relative to `$HOME`, so `nvim/.config/nvim/init.lua` is linked to
`~/.config/nvim/init.lua`.

From this repository, link all packages with:

```sh
stow --target="$HOME" aerospace atuin ghostty hypr kitty lazygit nvim sketchybar skhd spicetify starship swaylock tmux txtv waybar wofi yabai yazi zsh
```

To link a single package:

```sh
stow --target="$HOME" nvim
```

To remove links for a package:

```sh
stow --delete --target="$HOME" nvim
```

Run a dry-run first if you want to check for conflicts without changing files:

```sh
stow --no --verbose --target="$HOME" nvim
```

Do not commit secrets. Keep tokens, API keys, credentials, private keys, shell
history, and application state outside this repository.

## Packages

- eza
- jujutsu
- (lazygit)
- nvim
- starship
- tmux
- txtv
- yazi
- zoxcide

## Mac

- aerospace
- ghostty
- sketchybar
- skhd
- zsh

## Arch

- hypr
- kitty
- swaylock
- waybar
- wofi
