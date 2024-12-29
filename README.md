# Neovim configuration

My configuration file for AstroNvim (Neovim).

## Installation

0. Clone, build, and install latest Neovim from https://github.com/neovim/neovim.git
1. git clone --depth 1 https://github.com/AstroNvim/template ~/.config/astronvim
2. rm -rf ~/.config/astronvim/.git
3. alias vim='NVIM_APPNAME=astronvim nvim'
4. Run vim and let it install astronvim
5. Install astronvim-config.lua in ~/.config/astronvim/lua/plugins/
4. Run vim again and let it install plugins

## Notes

Remember to run `:checkhealth` to optimize your nvim configuration and
`:Lazy update` to keep plugins up to date.

I see people remapping nvim keys but I recommend using default keys because
then you can use nvim everywhere and it is a lot easier to maintain. Do not
become a slave of custom mappings that only works with your setup.

