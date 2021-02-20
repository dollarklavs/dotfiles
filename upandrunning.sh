#!/bin/bash
# MacOS Catalina install
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s /Users/$USER/dotfiles/.tmux.conf /Users/$USER/.tmux.conf 

brew install python3
brew install neovim
pip3 install --user --upgrade neovim
pip3 install --user git+git://github.com/Lokaltog/powerline
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p /Users/$USER/.config/nvim
ln -s /Users/$USER/dotfiles/.vimrc /Users/$USER/.config/nvim/init.vim
# Inside neovim
# :PlugInstall

ln -s /Users/$USER/dotfiles/.zshrc /Users/$USER/.zshrc
mkdir -p ~/.zsh
cd ~/.zsh
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
