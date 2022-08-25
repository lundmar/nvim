# Neovim configuration

A simple Neovim lua configuration which provides a powerful PDE (Personalized Development Environment) for C/C++ development.


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
