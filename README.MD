# Nvim configs

This is some configurations for nvim setup for development

~/.config/nvim/init.lua
~/.config/nvim/lua/user/plugins.lua
~/.config/nvim/after/plugins/

-Reference: https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84


Link on how to config nerdy fonts...
- https://github.com/ryanoasis/nerd-fonts


## Next steps

- Telescope with fuzzy finder
- Java development
- Javascript (angualar) development
- Check lazygit -  https://www.youtube.com/watch?v=hwC4JduRHyg

## LSP

- Install lua-language-server
- Install typescript-language-server
- Install @fsouza/prettierd -- Prettier code formatter daemon


```shell
sudo apt install gcc g++ clang ninja-build

mkdir -p .config/lsp
cd ~/.config/lsp
git clone --depth=1 https://hub.fastgit.xyz/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

```

tree-sitter

The instalation of tree-sitter can be made by npm, source code from repository or package install.

from npm is :

```shell
npm install -g tree-sitter
```

typescript language server is needed to complete the code completion

```shell
npm install -g typescript-language-server
```

To install lua-language-server inside macos, just execute:

```shell
brew install lua-language-server
```



Install prettierd

```shell
npm install -g @fsouza/prettierd
``` 
