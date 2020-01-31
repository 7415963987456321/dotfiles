#
#    █████▒ ██▓  ██████  ██░ ██
#  ▓██   ▒ ▓██▒▒██    ▒ ▓██░ ██▒
#  ▒████ ░ ▒██▒░ ▓██▄   ▒██▀▀██░
#  ░▓█▒  ░ ░██░  ▒   ██▒░▓█ ░██
#  ░▒█░    ░██░▒██████▒▒░▓█▒░██▓
#   ▒ ░    ░▓  ▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒
#   ░       ▒ ░░ ░▒  ░ ░ ▒ ░▒░ ░
#   ░ ░     ▒ ░░  ░  ░   ░  ░░ ░
#           ░        ░   ░  ░  ░

### Fish greeter
function fish_greeting
	figlet \: \( \) \{ \: \| \: \& \} \; \: 
	neofetch --stdout 
end

### NNN CD ON QUIT HACK
function n --description 'support nnn quit and change directory'
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end
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
export KITTY_ENABLE_WAYLAND=1
# export $BROWSER=/usr/bin/luakit
export NNN_USE_EDITOR=1
export EDITOR=vim
export XKB_DEFAULT_LAYOUT=is
export SWAY_CURSOR_THEME=whiteglass
export _JAVA_AWT_WM_NONREPARENTING=1
export CLUTTER_BACKEND=wayland
export BEMENU_BACKEND=wayland

set -xU LESS_TERMCAP_md (printf "\e[01;31m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")

# Keymaps
setxkbmap is

### ALIAS
alias Syu='sudo pacman -Syu'
alias S='sudo pacman -S'
alias R='sudo pacman -R'
alias lsa='exa -abghHlS'
alias ls='exa'
alias nv='nvim'
alias cl='clear'
alias ht='htop'
alias mu='mupdf'
alias m='man'
alias gt='gotop'
alias icat='kitty +kitten icat'
alias wttr='curl -s wttr.in'
alias clone='~/.config/fish/scripts/clone.sh'
alias com='~/.config/fish/scripts/com.sh'
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
#alias scrot='slurp | grim -g - $(xdg-user-dir PICTURES)/$(date +'%Y-%m-%d-%H%M%S_grim.png')'
#Git aliases
alias gcm='git checkout master'
alias gp='git pull'
# FOR MANPAGES
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

status --is-interactive; and . (jump shell | psub)
cat ~/.cache/wal/sequences &
