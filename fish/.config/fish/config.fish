## Set values

# Hide welcome message & ensure we are reporting fish as shell

set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x SHELL /usr/bin/fish
set -x EDITOR /usr/bin/hx

set -g theme_nerd_fonts yes
fish_vi_key_bindings
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block
# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low
## Export variable need for qt-theme

if type qtile >>/dev/null 2>&1
	set -x QT_QPA_PLATFORMTHEME qt5ct
end

# Set settings for https://github.com/franciscolourenco/done
pokemon-colorscripts --no-title -r

set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Environment setup

# Apply .profile: use this to put fish compatible .profile stuff in

if test -f ~/.fish_profile
	source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
	if not contains -- ~/.local/bin $PATH
		set -p PATH ~/.local/bin
	end
end

# Add depot_tools to PATH

if test -d ~/Applications/depot_tools
	if not contains -- ~/Applications/depot_tools $PATH
		set -p PATH ~/Applications/depot_tools
	end
end

## Starship prompt

if status --is-interactive
	source ("/usr/bin/starship" init fish --print-full-init | psub)
end

## Advanced command-not-found hook

# source /usr/share/doc/find-the-command/ftc.fish

## Functions

# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang

function __history_previous_command
	switch (commandline -t)
		case "!"
			commandline -t $history[1]
			commandline -f repaint
		case "*"
			commandline -i !
	end
end

function __history_previous_command_arguments
	switch (commandline -t)
		case "!"
			commandline -t ""
			commandline -f history-token-search-backward
		case "*"
			commandline -i '$'
	end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ]
	bind -Minsert ! __history_previous_command
	bind -Minsert '$' __history_previous_command_arguments
else
	bind ! __history_previous_command
	bind '$' __history_previous_command_arguments
end

# Fish command history

function history
	builtin history --show-time='%F %T '
end

function backup --argument filename
	cp $filename $filename.bak
end

# Copy DIR1 DIR2

function copy
	set count (count $argv | tr -d \n)
	if test "$count" = 2; and test -d "$argv[1]"
		set from (echo $argv[1] | trim-right /)
		set to (echo $argv[2])
		command cp -r $from $to
	else
		command cp $argv
	end
end

# Cleanup local orphaned packages

function cleanup
	while pacman -Qdtq
		sudo pacman -R (pacman -Qdtq)
	end
end

# FZF
# set up fzf key bindings
fzf --fish | source
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Get the error messages from journalctl
alias jctl 'journalctl -p 3 -xb'

# Recent installed packages
alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

zoxide init fish | source
mcfly init fish | source
# mcfly-fzf init fish | source

# Replace classic tools with modern alternatives

alias ls 'eza -al --color=always --group-directories-first --icons' # preferred listing
alias la 'eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons' # long format
alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles

alias cat 'bat --style header --style snip --style changes --style header'

if not test -x /usr/bin/yay; and test -x /usr/bin/paru
	alias yay paru
end

# Commonly useful alias

alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias big 'expac -H M "%m\t%n" | sort -h | nl' # Sort installed packages according to size in MB (expac must be installed)
alias dir 'dir --color=auto'
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias grep 'ugrep --color=auto'
alias egrep 'ugrep -E --color=auto'
alias fgrep 'ugrep -F --color=auto'
alias grubup 'sudo update-grub'
alias hw 'hwinfo --short' # Hardware Info
alias ip 'ip -color'
alias ps procs
alias psmem 'ps auxf | sort -nr -k 4'
alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
alias rmpkg 'sudo pacman -Rdd'
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '
alias upd 'sudo pacman -Syu'
alias vdir 'vdir --color=auto'
alias wget 'wget -c '
alias vi nvim
alias vc 'NVIM_APPNAME=nvchad nvim'
alias vz 'NVIM_APPNAME=lazy nvim'
alias vj 'NVIM_APPNAME=jrvim nvim'
alias vb 'NVIM_APPNAME=neobean nvim'
alias y yazi
alias c clear

# Get fastest mirrors

alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

# Help people new to Arch

alias apt 'man pacman'
alias apt-get 'man pacman'
alias please sudo
alias tb 'nc termbin.com 9999'
alias helpme 'echo "To print basic information about a command use tldr <command>"'
alias pacdiff 'sudo -H DIFFPROG=meld pacdiff'

abbr mkdir 'mkdir -p'

# Get the error messages from journalctl

alias jctl 'journalctl -p 3 -xb'

# Recent installed packages

alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

# Abstractions for better readability

function no_error_output
	$argv 2>/dev/null
end

function parameter_is_provided
	set -q argv[1]
end

function command_failed
	test $status -eq 1
end

function newline
	echo ""
end

function updated
	test 2400 -ge (path mtime --relative /var/log/pacman.log) && # Prevents that updates run even if the system has been updated recently.
		string match -rq "System is updated" (tail -2 /var/log/pacman.log) # Prevents that canceled updates count as complete updates.
end

function log_update
	echo [(date +"%Y-%m-%dT%T%z")] [FISH] System is updated | sudo tee -a /var/log/pacman.log >/dev/null
end

# add and friends

function add --wraps "paru -S"
	if not updated
		update --skip-mirrorlist --noconfirm &&
			paru -Sua --skipreview --useask --noconfirm &&
			sudo pkgfile --update &&
			log_update &&
			add $argv
	else
		newline
		set_color green
		echo "System is up to date."
		set_color normal && newline

		if parameter_is_provided $argv
			no_error_output sudo pacman -S --noconfirm $argv &&
				log_update
			if command_failed
				no_error_output paru -S --aur --skipreview --useask --noconfirm $argv &&
					log_update
				if command_failed
					newline && search $argv
				end
			end
		end
	end
end

function search --wraps "paru -Ss"
	set -l success no
	paru -Ss --aur $argv; and set success yes; and newline
	pacman -Ss $argv; and set success yes; and newline
	no_error_output pacman -Qi $argv; and set success yes
	if test $success = no
		read -p 'set_color green; echo -n "$prompt No results found. Do you like to look up package files? [Y/n]: "; set_color normal' -l confirm
		switch $confirm
			case Y y ''
				pkgfile -vri $argv
			case N n
				return 1
		end
	end
end

function remove --wraps "pacman -Runs"
	sudo pacman -Runs --noconfirm $argv
	if command_failed
		sudo pacman -Rcns $argv
		if not command_failed
			echo "You can always rollback to a previous state of your system, simply by selecting 'Garuda Snapshots' in the boot menu."
		end
	end
end

function commit
	if parameter_is_provided $argv
		git add .
		git commit -am "$argv"
		git push
	else
		newline
		echo "Please provide a commit message:" && newline
		set_color blue
		printf "commit "
		set_color green
		printf "\"this is a commit message\""
		set_color normal
	end
end

set -gx GOPATH $HOME/go
set -gx GOROOT $HOME/.go
set -gx PATH $GOPATH/bin $PATH
# g-install: do NOT edit, see https://github.com/stefanmaric/g
alias ggovm="$GOPATH/bin/g"

set PATH $PATH ~/.cargo/bin
# set -Ux PYENV_ROOT $HOME/.pyenv
# fish_add_path $PYENV_ROOT/bin
# pyenv init - | source

direnv hook fish | source

# fastfetch

# bun
# set --export BUN_INSTALL "$HOME/.bun"
# set --export PATH $BUN_INSTALL/bin $PATH
