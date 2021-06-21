#!/usr/bin/env sh

if [[ -z "${DEPLOY_ENV}" ]]; then
    DOTFILES="$HOME/.dotfiles"
    echo "Using default dotfiles location: $DOTFILES"
else
    DOTFILES="${DOTFILES}"
fi

mkdir -p $HOME/.local/bin

# Terminal stuff
test -L $HOME/.config/alacritty        || ln -s $DOTFILES/etc/alacritty $HOME/.config/alacritty
test -L $HOME/.tmux.conf               || ln -s $DOTFILES/etc/.tmux.conf $HOME/.tmux.conf
test -L $HOME/.config/fish/config.fish || ln -s $DOTFILES/etc/fish/config.fish $HOME/.config/fish/config.fish
test -L $HOME/.config/starship.toml    || ln -s $DOTFILES/etc/starship.toml $HOME/.config/starship.toml

# Git config
test -L $HOME/.gitconfig            || ln -s $DOTFILES/etc/.gitconfig $HOME/.gitconfig

# Text editors
test -L $HOME/.config/nvim          || ln -s $DOTFILES/etc/nvim $HOME/.config/nvim

# Window management
test -L $HOME/.config/yabai     || ln -s $DOTFILES/etc/yabai $HOME/.config/yabai
test -L $HOME/.config/skhd      || ln -s $DOTFILES/etc/skhd $HOME/.config/skhd
test -L $HOME/.config/limelight || ln -s $DOTFILES/etc/limelight $HOME/.config/limelight
test -L $HOME/.config/spacebar  || ln -s $DOTFILES/etc/spacebar $HOME/.config/spacebar

if [[ "$1" == "home" ]]; then
    # Mail
    test -L $HOME/.mbsyncrc         || ln -s $DOTFILES/etc/.mbsyncrc $HOME/.mbsyncrc
    test -L $HOME/.config/mutt      || ln -s $DOTFILES/etc/mutt $HOME/.config/mutt
fi

test -L $HOME/.local/bin/gaps   || ln -s $DOTFILES/scripts/gaps $HOME/.local/bin/gaps
