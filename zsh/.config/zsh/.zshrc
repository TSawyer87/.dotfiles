# Load required modules
autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "- (%b) "
precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst
# Customize prompt
# PS1="%{$fg[blue]%}%B[%b%{$fg[cyan]%}%n%{$fg[grey]%}%B@%b%{$fg[cyan]%}%m%{$fg[blue]%}%B]-%b%{$fg[blue]%}%B[%b%{$fg[white]%}%~%{$fg[blue]%}%B]%b %{$fg[cyan]%}%B>>>%b%{$reset_color%} %G"
PS1="%{$fg[blue]%}%B[%b%{$fg[cyan]%}%n%{$fg[grey]%}%B@%b%{$fg[cyan]%}%m%{$fg[blue]%}%B]-%b%{$fg[blue]%}%B[%b%{$fg[white]%}%~%{$fg[blue]%}%B]%b
%{$fg[cyan]%}%B>>>%b%{$reset_color%} "

# Set Git status format (adjust as needed)
zstyle ':vcs_info:git:*' formats '%b (%B%R%b)%n'
RPROMPT="%F{241}%B%t%b%f"
## Path section
# Set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

# eval "$(starship init zsh)"
# function set_win_title(){
#     echo -ne "\033]0; $USER@$HOST:${PWD/$HOME/~} \007"
# }
# precmd_functions+=(set_win_title)


pokemon-colorscripts --no-title -s -r

## Plugins section: Enable fish style features
# Use syntax highlighting
 source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use autosuggestion
 source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use history substring search
 source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

 # Use zsh-vi-mode
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Use fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# fzf-tab
source ~/.config/zsh/plugins/fzf-tab.plugin.zsh

# Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

# Advanced command-not-found hook
[[ -e /usr/share/doc/find-the-command/ftc.zsh ]] && source /usr/share/doc/find-the-command/ftc.zsh



# HISTFILE=~/.zhistory
# HISTSIZE=50000
# SAVEHIST=10000

export KEYTIMEOUT=1  # makess the switch between nodes quicker



eval "$(zoxide init zsh)"
eval "$(mcfly init zsh)"
# eval "$(mcfly-fzf init zsh)"

source ~/.config/zsh/aliases
source ~/.config/zsh/functions
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/options
## Run fastfetch
# fastfetch

 # source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
      # ctrl_l() {
      #     builtin print -rn -- $'\r\e[0J\e[H\e[22J' >"$TTY"
      #     builtin zle .reset-prompt
      #     builtin zle -R
      # }
      # zle -N ctrl_l
      # bindkey '^l' ctrl_l

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
 # [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
