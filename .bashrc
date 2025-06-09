# ========================
# STARTUP
# ========================

clear
echo "Good Morning, Afternoon, or Evening"
echo "where ever you may be in the world"

# ========================
#  FROM DEFAULT
# ========================
[ -z "$PS1" ] && return

shopt -s checkwinsize

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
			# check because c-n-f could've been removed in the meantime
				if [ -x /usr/lib/command-not-found ]; then
		/usr/lib/command-not-found -- "$1"
				return $?
				elif [ -x /usr/share/command-not-found/command-not-found ]; then
		/usr/share/command-not-found/command-not-found -- "$1"
				return $?
		else
		printf "%s: command not found\n" "$1" >&2
		return 127
		fi
	}
fi

# ========================
#  Environment Variables
# ========================
export EDITOR=nano				# Change to vim or nano as preferred
export HISTSIZE=10000			# Increase history size
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups  # Ignore duplicates in history
export LS_OPTIONS="--color=auto"

# ========================
#  Aliases
# ========================
alias ll='ls -lah'				# Long listing format
alias la='ls -A'				# Show hidden files
alias grep='grep --color=auto'	# Highlight search results
alias cls='clear -x'			# Clear screen

# Safer commands
alias rm='rm -i'				# Prompt before remove
alias cp='cp -i'				# Prompt before copy
alias mv='mv -i'				# Prompt before move

# Git shortcuts
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'

# python 
alias pyt="clear -x && python3"
alias venv_data="source venv_data_analytics/bin/activate"
alias venv_disc="source venv_discord/bin/activate"
alias venv_t="source venv_thesis/bin/activate"

# misc
alias loopback="pactl load-module module-loopback"
alias notif="venv_disc && cd git/bitz/notifications/ && pyt main.py"

# ========================
#  Custom Functions
# ========================
# Extract archives easily
extract () {
	if [ -f "$1" ]; then
		case "$1" in
			*.tar.bz2)
			tar xjf "$1" ;;
			*.tar.gz)
			tar xzf "$1" ;;
			*.bz2)
			bunzip2 "$1" ;;
			*.rar)
			unrar x "$1" ;;
			*.gz)
			gunzip "$1" ;;
			*.tar)
			tar xf "$1" ;;
			*.tbz2)
			tar xjf "$1" ;;
			*.tgz)
			tar xzf "$1" ;;
			*.zip)
			unzip "$1" ;;
			*.7z)
			7z x "$1" ;;
			*)
			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Go up N directories
up() {
	local d=""
	local count=${1:-1}
	while [ "$count" -gt 0 ]; do
		d="../$d"
		count=$((count - 1))
	done
	cd "$d" || exit
}

# ========================
#  Prompt Customization
# ========================
export PS1="\[\e[1;32m\]\u@\h:\w\[\e[0m\]$ "
