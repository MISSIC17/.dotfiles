# Created by newuser for 5.9
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
ZSH_THEME="agnoster"
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/missic/.zshrc'
# aliases

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias edith='nvim ~/.config/hypr/hyprland.conf'
alias editway='nvim ~/.config/waybar/config.jsonc'
alias editb='nvim ~/.bashrc'
alias editz='nvim ~/.zshrc'
alias sr='wf-recorder -g "$(slurp)"'
alias ll="ls -a"
alias pp="git pull && git push"
alias gst="git status"
alias keys="xev"
alias prettyjson='python -m json.tool'


autoload -Uz compinit

# functions
#`
#`
#`@brings argument workspace to current monitor
bwc() {
	hyprctl dispatch moveworkspacetomonitor "$1" current
}
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

# pnpm
export PNPM_HOME="/home/missic/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
compinit
# End of lines added by compinstall


PATH=~/.console-ninja/.bin:$PATH
eval "$(starship init zsh)"
