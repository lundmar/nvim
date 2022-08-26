# Neovim configuration

A simple Neovim lua configuration which provides a powerful PDE (Personalized
Development Environment) for C/C++ development.

Feel free to use and share.

Tested with latest Neovim git source from https://github.com/neovim/neovim.git

## Main features

 * Single configuration file (simplest possible, no need to fragment into multiple files)
 * Code completion is provided by clangd LSP server (C/C++) but more can easily be enabled
 * Syntax highlighting is enabled for all languages available by TreeSitter plugin
 * Auto-completion for commands, buffers, path, and LSP
 * Tag file is managed by gutentags which makes it possible to quickly navigate huge code bases
 * Tabs are 4 spaces by default
 * Copy buffer is shared with system clipboard
 * Remembers last cursor position
 * Git support (shows changed lines etc.)
 * Press F8 to show function list etc.


## Installation

1. Put init.lua here: ~/.config/nvim/init.lua
2. Run `git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
3. Open nvim and run `:PackerInstall`

## Notes

Remember to sometimes run `:checkhealth` to optimize your nvim configuration

I see a lot of people remapping nvim keys but I recommend using default keys
because then you can use nvim everywhere and it is a lot easier to maintain.

