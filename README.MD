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


