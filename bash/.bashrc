#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
force_color_prompt=yes
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias edith='vim ~/.config/hypr/hyprland.conf'
alias editway='vim ~/.config/waybar/config.jsonc'
alias sr='wf-recorder -g "$(slurp)"'
alias ll="ls -a"
alias pp="git pull && git push"
alias keys="xev"
# PS1='[\u@\h \W]\$ '


eval "$(starship init bash)"

eval "$(starship init bash)"

eval "$(starship init bash)"

PATH=~/.console-ninja/.bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# functions
#`
#`
#`@brings argument workspace to current monitor
bwc(){
	hyprctl dispatch moveworkspacetomonitor "$1" current
}
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

