#     ▄████████  ▄█     ▄████████    ▄█    █▄    
#   ███    ███ ███    ███    ███   ███    ███   
#   ███    █▀  ███▌   ███    █▀    ███    ███   
#  ▄███▄▄▄     ███▌   ███         ▄███▄▄▄▄███▄▄ 
# ▀▀███▀▀▀     ███▌ ▀███████████ ▀▀███▀▀▀▀███▀  
#   ███        ███           ███   ███    ███   
#   ███        ███     ▄█    ███   ███    ███   
#   ███        █▀    ▄████████▀    ███    █▀    

### Fish greeter
function fish_greeting
	figlet \: \( \) \{ \: \| \: \& \} \; \: 
	neofetch --stdout 
end

export NNN_TMPFILE="/tmp/nnn"
export NNN_PLUG='o:fzopen;d:diffs;m:nmount;n:notes;v:imgviu;p:mpv'

function n --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if [ (expr $NNNLVL + 0) -ge 1 ]
        echo "nnn is already running"
        return
    end

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, export NNN_TMPFILE after the call to nnn
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef

    nnn $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end

### CD AND LS
function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end

### EXPORTS
export NNN_USE_EDITOR=1
export EDITOR=vim
export XKB_DEFAULT_LAYOUT=is
export SWAY_CURSOR_THEME=whiteglass
export _JAVA_AWT_WM_NONREPARENTING=1
export LANG=is_IS.UTF-8
export FZF_DEFAULT_COMMAND='fd --type f'

set -xU LESS_TERMCAP_md (printf "\e[01;31m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")

# Keymaps
setxkbmap is

### ALIAS
#alias n=nnn
alias mk=touch
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
alias Syu='sudo pacman -Syu'
alias S='sudo pacman -S'
alias R='sudo pacman -R'
alias lsa='exa -abghHlS'
alias ls='exa'
alias nv='nvim'
alias cl='clear'
alias ht='htop'
alias tm='tmux'
alias m='man'
alias mu='mupdf'
alias gt='gotop'
alias wttr='curl -s wttr.in'
alias clone='~/.config/fish/scripts/clone.sh'
# Git stöff
alias ga='git add'
alias gc='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gs='git stash'

alias mus='n /run/media/keli/TunaFish/Music'
