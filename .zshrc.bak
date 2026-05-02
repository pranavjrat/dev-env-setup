# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~/.zshrc
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Set suggestion color and style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#f5c2e7'

# Enable history file
HISTFILE=~/.zsh_history

# Set the maximum number of lines to keep in the history file
HISTSIZE=10000

# Set the maximum number of lines to keep in memory
SAVEHIST=10000

# Append to the history file instead of overwriting it
setopt append_history

# Share history between all Zsh sessions
setopt inc_append_history
setopt share_history

# Avoid duplicates in history
setopt hist_ignore_dups
setopt hist_ignore_space

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept


eval "$(starship init zsh)"
alias update="sudo pacman -Syu"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vi="nvim"
alias vim="nvim"
alias valhalla="sudo ~/.scripts/update-mirrors.sh; sudo pacman -Syu --noconfirm; yay -Syu --noconfirm; caa -s; ~/.scripts/save_workspaces.sh; systemctl poweroff"
alias shazam="sudo ~/.scripts/update-mirrors.sh; sudo pacman -Syu --noconfirm ; yay -Syu --noconfirm; caa -s; ~/.scripts/save_workspaces.sh; systemctl suspend"
avadakedavra() {
    local minutes=${1:-0}
    
    if [[ $minutes -gt 0 ]]; then
        echo "⏰ Scheduled shutdown in $minutes minute(s)..."
        echo "Press Ctrl+C to cancel"
        sleep ${minutes}m
    fi
    
    echo "🔄 Cleaning up..."
    caa -s
    
    echo "💾 Saving workspaces..."
    ~/.scripts/save_workspaces.sh
    
    if [[ $? -eq 0 ]]; then
        echo "⚡ Powering off..."
        systemctl poweroff
    else
        echo "❌ Workspace save failed. Aborting shutdown."
        return 1
    fi
}
alias caaa='tmux new-session -A -s caa-run "caa"'
alias doubletap="caa -s;~/.scripts/save_workspaces.sh && systemctl reboot"
alias mountwin="sudo mount -t ntfs-3g /dev/nvme0n1p3 /mnt/windows;sudo chown -R heisenberg: /mnt/windows"
alias m="mkdir"
alias ll='ls -alF'
alias lockIt='sudo sh -c "echo mem > /sys/power/state"'
alias startlamp="sudo systemctl restart httpd;sudo systemctl restart mysqld"
alias stoplamp="sudo systemctl stop httpd;sudo systemctl stop mysqld"
alias sexybawa="caa -d"
alias sstart="caa -d"
alias sstop="caa -s"

alias streamlive="ffmpeg -f x11grab -framerate 60 -video_size 1918x1040 -i :0.0+1,1 \
    -f alsa -i hw:0 \
    -c:v libx264 -preset ultrafast -tune zerolatency -b:v 4500k \
    -c:a aac -b:a 192k -ar 44100 \
    -f mpegts udp://172.16.116.169:1234"


compilegl() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: compilegl <source_file> <output_program>"
        return 1
    fi
    gcc -o "$2" "$1" -lglut -lGLU -lGL
}
alias yt-video-download='yt-dlp -f bestvideo+bestaudio/best --merge-output-format mp4'
alias services='sudo systemctl list-units --type=service --state=running'
alias saymyname="~/.config/polybar/scripts/update-aur.sh"
alias canyouhearthemusic='flatpak run com.github.wwmm.easyeffects'

export TMUX_CONF="$HOME/.config/tmux/.tmux.conf"
alias tmux="tmux -f $TMUX_CONF"


# Created by `pipx` on 2024-10-14 20:26:28
export PATH="$PATH:/home/heisenberg/.local/bin"
export PATH="$PATH:/home/heisenberg/Documents/personal/dev-env"
export PATH="$HOME/.local/scripts:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"


# Kitty shell integration for command notifications
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    source "$KITTY_INSTALLATION_DIR/shell-integration/zsh/kitty.zsh"
fi

export PATH=$HOME/.config/rofi/scripts:$PATH

export PATH=$PATH:/home/heisenberg/.spicetify

# Added by virtual environment setup script
# Python Virtual Environment Setup for ZSH
# Add this to your ~/.zshrc file

# Create a default virtual environment directory
export VENV_DIR="$HOME/.local/venvs"
mkdir -p "$VENV_DIR"

# Function to create and activate a virtual environment
venv() {
    local venv_name="${1:-default}"
    local venv_path="$VENV_DIR/$venv_name"
    
    if [ ! -d "$venv_path" ]; then
        echo "Creating virtual environment: $venv_name"
        python3 -m venv "$venv_path"
    fi
    
    echo "Activating virtual environment: $venv_name"
    source "$venv_path/bin/activate"
}

# Function to deactivate current virtual environment
venv_off() {
    if [ -n "$VIRTUAL_ENV" ]; then
        deactivate
        echo "Virtual environment deactivated"
    else
        echo "No virtual environment is currently active"
    fi
}

# Function to list available virtual environments
venv_list() {
    echo "Available virtual environments:"
    ls -1 "$VENV_DIR" 2>/dev/null || echo "No virtual environments found"
}

# Function to remove a virtual environment
venv_remove() {
    local venv_name="$1"
    if [ -z "$venv_name" ]; then
        echo "Usage: venv_remove <environment_name>"
        return 1
    fi
    
    local venv_path="$VENV_DIR/$venv_name"
    if [ -d "$venv_path" ]; then
        rm -rf "$venv_path"
        echo "Removed virtual environment: $venv_name"
    else
        echo "Virtual environment '$venv_name' not found"
    fi
}

# Smart pip function that automatically uses virtual environment
pip3() {
    if [ -z "$VIRTUAL_ENV" ]; then
        echo "No virtual environment active. Creating/activating default environment..."
        venv default
    fi
    command pip3 "$@"
}

# Also override pip if it exists
if command -v pip >/dev/null 2>&1; then
    pip() {
        if [ -z "$VIRTUAL_ENV" ]; then
            echo "No virtual environment active. Creating/activating default environment..."
            venv default
        fi
        command pip "$@"
    }
fi

# Auto-activate virtual environment in project directories
# This function checks for a .venv directory or requirements.txt
auto_venv() {
    if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
        local project_venv="$(basename $(pwd))"
        if [ -z "$VIRTUAL_ENV" ] || [[ "$VIRTUAL_ENV" != *"$project_venv"* ]]; then
            echo "Python project detected. Activating virtual environment..."
            venv "$project_venv"
        fi
    fi
}

# Hook to run auto_venv when changing directories
chpwd() {
    auto_venv
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#h
