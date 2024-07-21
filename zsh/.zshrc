# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="starship"
ZSH_THEME="powerlevel10k/powerlevel10k"

setopt autocd   # change directory just by typing its name
setopt interactivecomments  # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch  #  hide error message if there is no match for the pattern
setopt notify  # report the status of background jobs immediately
setopt numericglobsort     #  sort filenames numerically when it makes sense
setopt promptsubst  #  allow substituted commands in prompt

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=''

# configure key keybindings
# bindkey ' ' magic-space  # do history expansion on space
# bindkey '^U' backward-kill-line  # ctrl + U
# bindkey '^[[3;5~' kill-word      # ctrl + Supr
# bindkey '^[[3~' delete-char      # delete
# bindkey '^[[1;5C' forward-word   # ctrl + cursor right
# bindkey '^[[1;5D' backward-word  # ctrl + cursor left
# bindkey '^[[5~' beginning-of-buffer-or-history  # PgUp
# bindkey '^[[6~' end-of-buffer-or-history  # PgUp/PgDown
# bindkey '^[[H' beginning-of-line    # home
# bindkey '^[[F' end-of-line       # end
# bindkey '^[[Z' undo              # shift + tab undo last action

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it

# Share history in every terminal session
setopt SHARE_HISTORY
# force zsh to show the complete history
alias history="history 0"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
 zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
 zstyle ':omz:update' frequency 2

# Uncomment the following line if pasting URLs and other text is messed up.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
 COMPLETION_WAITING_DOTS="true"

 DISABLE_UNTRACKED_FILES_DIRTY="true"

# see 'man strftime' for details.
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
sudo
fast-syntax-highlighting
# zsh-autocomplete
zsh-syntax-highlighting
# zsh-autosuggestions
zsh-vi-mode
# autojump
# colorize
fzf
fzf-tab
fancy-ctrl-z
rust
# starship
)
# ZSH_COLORIZE_TOOL=chroma
# ZSH_COLORIZE_STYLE="colorful"
# ZSH_COLORIZE_CHROMA_FORMATTER=terminal256

# Fancy Ctrl-Z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="nvim"
alias py="python3"
alias u="sudo dnf -y update"
alias cat="bat"
alias ld='eza -lD'
alias lf='eza -lf --color=always | grep -v /'
alias lh='eza -al --group-directories-first'
alias ls="ls --color=auto"
alias lS='eza -alf --color=always --sort=size | grep -v /'
alias lt='eza -al --sort=modified'
alias lg="lazygit"
alias obsidian="flatpak run md.obsidian.Obsidian"
alias vz="NVIM_APPNAME=nvim-lazyvim nvim"
alias vc="NVIM_APPNAME=nvchad nvim"
alias va="NVIM_APPNAME=astrovim nvim"
alias fzf="fzf --preview 'bat --style=numbers --color=always {} | head -500'"

#This makes Tab and ShiftTab, when pressed on the command line, cycle through listed completions, without changing what's listed in the menu:
# bindkey              '^I'         menu-complete
# bindkey "$terminfo[kcbt]" reverse-menu-complete
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias ggovm="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
source "$HOME/.cargo/env"
fastfetch
# export FPATH="~/.eza_completions/completions/zsh:$FPATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
fpath+=${ZDOTDIR:-~}/.zsh_functions
export PATH="$PATH:/cargo/bin/alacritty"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # enable auto-suggestions based on the history
# if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
#   . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#   # change suggestion color
#   ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999"
# fi

# enable command-not-found if installed
if [ -e /etc/zsh_command_not_found ]; then
  . /etc/zsh_command_not_found
fi

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
