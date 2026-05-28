# Must be at the very top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# Illogical Impulse / Quickshell virtual environment (no ~)
export ILLOGICAL_IMPULSE_VIRTUAL_ENV="$HOME/.local/state/quickshell/.venv"

export PATH="$PATH:/home/heisenberg/.local/bin"
export PATH="$PATH:/home/heisenberg/Documents/personal/dev-env"
export PATH="$HOME/.local/scripts:$PATH"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space

bindkey -v  
bindkey '^ ' autosuggest-accept

# ------------------------------------------------------------------------------------
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vi="nvim"
alias vim="nvim"
alias m="mkdir"
alias ll='ls -alF'

export TMUX_CONF="$HOME/.tmux.conf"
alias tmux="tmux -f $TMUX_CONF"

alias services='sudo systemctl list-units --type=service --state=running'
alias caaa='tmux new-session -A -s caa-run "caa"'
alias mountwin="sudo mount -t ntfs-3g /dev/nvme0n1p3 /mnt/windows;sudo chown -R heisenberg: /mnt/windows"
alias todo='[ -f TODO.md ] && nvim TODO.md || nvim ~/Documents/personal/Notes/todo.md'
alias dp='nvim ~/Documents/personal/Notes/Developer-productivity.md'
alias mem='df -h / | awk "NR==2 {print \$5}"'

# ------------------------------------------------------------------------------------

# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Manage node versions
FNM_PATH="/home/heisenberg/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
