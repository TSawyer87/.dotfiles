$env.config.show_banner = false
source ~/.zoxide.nu

# Theme
# source ~/.config/nushell/nu_scripts/themes/nu-themes/tokyo-night.nu
source ~/.config/nushell/nu_scripts/themes/nu-themes/dracula.nu

source ~/.config/nushell/nu_scripts/aliases/eza/eza-aliases.nu
source ~/.config/nushell/nu_scripts/aliases/git/git-aliases.nu
source ~/.config/nushell/nu_scripts/aliases/bat/bat-aliases.nu

source /home/jr/.config/nushell/nu_scripts/modules/fuzzy/fuzzy_history_search.nu
source /home/jr/.config/nushell/nu_scripts/modules/fuzzy/fuzzy_command_search.nu
source /home/jr/.config/nushell/nu_scripts/custom-menus/zoxide-menu.nu

# Cargo-Completions
source ~/.config/nushell/nu_scripts/custom-completions/cargo/cargo-completions.nu
# Tealdeer Completions
source ~/.config/nushell/nu_scripts/custom-completions/tealdeer/tldr-completions.nu

use ~/.config/nushell/init.nu *

use ~/.config/nushell/nupm/modules/nupm

alias ll = ls -l
alias y = yazi
alias vi = nvim
alias c = clear
alias upd = paru
alias cat = bat
alias fixpacman = sudo rm /var/lib/pacman/db.lck
alias hi = fuzzy-history-search
alias hf = fuzzy-command-search
alias lg = lazygit

# Cargo
alias cn = cargo new
alias cb = cargo build
alias cr = cargo run
alias ct = cargo test
alias cc = cargo check
alias cC = cargo clippy


# fastfetch
pfetch
# Starship Prompt
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
