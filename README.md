How to properly use this repository:

1) Install homebrew
2) Install neovim's nightly build with the following command
``````
brew install neovim --HEAD
``````
3) Create a `.config` directory in your `$HOME` folder
``````
mkdir ~/.config
cd ~/.config
``````
4) Clone this repository in the .config directory
``````
git clone https://github.com/ujwal-jain/nvim.git
``````
5) Install vim-plug for neovim using the following command:
``````
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
``````
Check out https://github.com/junegunn/vim-plug for more details
6) Change directoy to `nvim` and type the following into terminal:
``````
cd nvim
nvim init.vim
``````
Now, you should be in your init.vim file.
The file structure works like so:
``````
.
├── README.md                       ––> This file
├── init.vim                        ––> Main Config File
├── plugin                          ––> Custom plugin configuration
│   ├── airline.vim                 │
│   ├── colors.vim                  │
│   ├── fzf.vim                     │
│   ├── git.vim                     │
│   ├── lsp.vim                     │––> Custom plugin configuration
│   ├── nerdtree.vim                │
│   ├── sets.vim                    │
│   └── treesitter.vim              │
└── terminal.vim                    ––> Configuration for terminal commands
``````
7) Type `:PlugInstall` in order to install the necessary plugins

The file structure should now look like this:
``````
.
├── README.md                       ––> This file
├── init.vim                        ––> Main Config File
├── plugged                         ––> Directory for 'vim-plug'
├── plugin                          ––> Custom plugin configuration
│   ├── airline.vim                 │
│   ├── colors.vim                  │
│   ├── fzf.vim                     │
│   ├── git.vim                     │
│   ├── lsp.vim                     │––> Custom plugin configuration
│   ├── nerdtree.vim                │
│   ├── sets.vim                    │
│   └── treesitter.vim              │
└── terminal.vim                    ––> Configuration for terminal commands
``````
8) Enjoy neovim!
