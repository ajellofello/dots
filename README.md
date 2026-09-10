# DESCRIPTION

These are my dot-files for everything I use that I could backup.
Including neovim, hyprland, rofi, waybar, mako and probably some
other things I can't remember :p

This is a personal archive. I made it so that its easy to edit and
extend, with your own colorschemes for example, but that was made
for me as I didn't originally plan on making this repo public, but
I changed my mind.

**Basically do as you wish! My dots are yours!**

# LINKS

This section has the links for different things in this repo that _I
did not make_ 

**COLORSCHEMES**

- [everforest](https://github.com/neanias/everforest-nvim)
- [koda](https://github.com/oskarnurm/koda.nvim)
- [vague](https://github.com/vague-theme/vague.nvim)

**OTHER**

- [waybar CAVA](https://github.com/ray-pH/waybar-cava)
    This is a script that puts cava into waybar! (requires cava)

# SCRIPT

This section talks about the script [link.sh](./link.sh) in the root of the
repo.

I made this script to create symlinks for all of the configurations in this
repo to their destinations in either `$HOME/.config` or `$HOME` depending on the
config.

all configurations will be symlinked to `$HOME/.config/<config>` except for:

- `.bashrc`
- `walls/` (my wallpapers)

Those will be symlinked to `$HOME/<config>`.

**IMPORTANT:** please, backup all of your configurations before running the script
as it `rm -rf`s _**ALL**_ of the destinations before creating new symlinks.

# NOTES

Right now the all configs use [Iosevka Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/Iosevka.zip), so
if the fonts are broken, just make sure you have this installed ;)

