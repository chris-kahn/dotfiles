#!/usr/bin/env sh

echo "Installing..."

if [[ -z "${DEPLOY_ENV}" ]]; then
    DOTFILES="$HOME/.dotfiles"
    echo "Using default dotfiles location: $DOTFILES"
else
    DOTFILES="${DOTFILES}"
fi

if [[ "$1" == "home" ]] || [[ "$1" == "work" ]]; then
    echo "Installing brew/common.brew"
    brew bundle install --file=$DOTFILES/brew/common.brew
fi

if [[ "$1" == "home" ]]; then
    echo "Installing brew/home.brew"
    brew bundle install --file=$DOTFILES/brew/home.brew
    
    echo "Setting hostname"
    sudo scutil --set HostName contorta
    sudo scutil --set LocalHostName contorta
    sudo scutil --set ComputerName contorta
    dscacheutil -flushcache
fi

if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
    echo "Installing TMUX Plugin Manager"
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

if [[ "$SHELL" != "$(which fish)" ]]; then
    echo "Setting Fish as default shell"
    sudo sh -c 'echo $(which fish) >> /etc/shells'
    chsh -s $(which fish)

    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher install jorgebucaran/nvm.fish
fi

echo "Done."
