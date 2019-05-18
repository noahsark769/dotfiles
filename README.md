# dotfiles
For easy setup of new machines.

## Installation

```
# Clone the repo
cd ~/ # ~ installation necessary for keyboard maestro scripts
git clone git@github.com:noahsark769/dotfiles.git
cd dotfiles
# Copy scripts into your path
mkdir -p ~/bin
cp git-fuzzy-co ~/bin/
cp .vimrc ~/.vimrc
cp .bash_profile ~/.bash_profile
cp .bash_prompt ~/.bash_prompt
cp .slate ~/.slate
# Install pathogen from the instructions at https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/colors
cp Monokai.vim ~/.vim/colors/
```
