# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

bindkey  "^[[P"       delete-char

zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/pierre/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias mysql="$HOME/.local/bin/mycli -u root"

# Less Colors for Man Pages
# export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
# export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
# export LESS_TERMCAP_me=$'\e[0m'           # end mode
# export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
# export LESS_TERMCAP_so=$'\e[48;5;179;38;5;238m'    # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\e[0m'           # end underline
# export LESS_TERMCAP_us=$'\e[04;38;5;133' # begin underline'

if [[ $USER == "root" ]]
then
	user="%F{magenta}%n"
else
	user="%F{green}%n"
fi

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

RPROMPT="%F{blue}"\$vcs_info_msg_0_"%F{red}%*"
PROMPT="%(!.%F{magenta}%n.%F{green}%n) %F{blue}[%2~] %F{cyan}%# %f"
zstyle ':vcs_inf:git:*' format '%b'
