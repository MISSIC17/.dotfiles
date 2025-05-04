#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

force_color_prompt=yes
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias edith='nvim ~/.config/hypr/hyprland.conf'
alias editway='nvim ~/.config/waybar/config.jsonc'
alias editb='nvim ~/.bashrc'
alias sr='wf-recorder -g "$(slurp)"'
alias ll="ls -a"
alias pp="git pull && git push"
alias gst="git status"
alias keys="xev"
alias prettyjson='python -m json.tool'

# PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

PATH=~/.console-ninja/.bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

PATH=~/.cargo/bin:$PATH
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
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/missic/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/missic/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/missic/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/missic/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

