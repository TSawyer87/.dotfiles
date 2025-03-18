$env.config.show_banner = false
source ~/.zoxide.nu

source ~/.config/nushell/nu_scripts/themes/nu-themes/tokyo-night.nu

use ~/.config/nushell/init.nu *

use ~/.config/nushell/nupm/modules/nupm

alias ll = ls -l
alias y = yazi
alias vi = nvim
alias c = clear
alias upd = paru
alias cat = bat
alias fixpacman = sudo rm /var/lib/pacman/db.lck

# Starship Prompt
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
