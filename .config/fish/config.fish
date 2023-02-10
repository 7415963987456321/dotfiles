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
    #neofetch --stdout
end

# NNN settings (clean this up)
export NNN_TMPFILE="/tmp/nnn"
export NNN_PLUG='o:fzopen;d:diffs;m:nmount;n:notes;v:imgviu;p:mpv'
# export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_COLORS='6537'
export NNN_FCOLORS="a5a0d677fb2121f7c6d6abc4"
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
export EDITOR=nvim
export XKB_DEFAULT_LAYOUT=is
export SWAY_CURSOR_THEME=whiteglass
export _JAVA_AWT_WM_NONREPARENTING=1
export LANG=is_IS.UTF-8
export FZF_DEFAULT_COMMAND='fd --type f'
# export PATH='$PATH:/home/keli/.local/bin'
export SYSTEMD_EDITOR=/usr/bin/nvim

set -xU LESS_TERMCAP_md (printf "\e[01;31m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")

# Keymaps
setxkbmap is

### ALIAS
# alias n=nnn
alias nh=nohup
alias mk=touch
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
alias Syu='sudo pacman -Syu'
alias S='sudo pacman -S'
alias R='sudo pacman -R'
alias lsa='exa -abghHlS'
alias tree='exa -T'
alias ls='exa'
alias nv='nvim'
alias cl='clear'
alias ht='htop'
alias tm='tmux'
alias m='man'
alias mu='mupdf'
alias gt='gotop'
alias wttr='curl -s \'wttr.in/Reykjavik?M\''
alias clone='~/.config/fish/scripts/clone.sh'
alias wg-switch='~/.config/fish/scripts/wg-switch.sh'
alias yt='~/.config/fish/scripts/yt.sh'
alias journalctl='journalctl -xe'
alias nb='newsboat'
alias sc='systemctl'

# Coloring
alias ip='ip       --color=auto'
alias grep='grep   --color=auto'
alias dmesg='dmesg --color=auto'

set -xU LESS_TERMCAP_md (printf "\e[01;31m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")

# Git stöff
alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gc='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gs='git status'
alias gl='git log --stat'
alias glp='git log -p'
alias gd='git diff'
alias gw='git whatchanged'
alias gi='cat (eval git rev-parse --show-toplevel)/.gitignore'

# Hacky media
alias mus='n /run/media/keli/TunaFish/Music'

# Networking
export KELI_SERVER=keli@192.168.0.107
export SSH_PORT=1337
export SERVER_MAC=6c:62:6d:85:f2:a5 b
export PI=keli@192.168.0.107
alias server='ssh -p $SSH_PORT $KELI_SERVER'
alias wake='wol $SERVER_MAC'

alias whoami="whoami && curl ifconfig.co && ip route get 1 | awk '{printf \$7;}'"
# Goddamnit fish-shell, just support IGNOREEOF
bind \cd\cd\cd delete-or-exit

# Goddamnit fish, what is this bullshit
function fish_command_not_found
    __fish_default_command_not_found_handler $argv
end

#mkdir and cd
function mkdir -d "Create a dir and set CWD"
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'
            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

# Throw file to pastebin
function pb
    if set -q argv[1]
        curl -F "file=@$argv[1]" https://0x0.st
    end
end



function fish_prompt -d "Prompt with jobs indicator"
    set -l user_char '>'
    if fish_is_root_user
        set user_char '#'
    end
    # Number of background jobs in shell
    if test -z "$last_pid"
        printf (set_color blue)'[%s] ' (jobs | wc -l)
    end
    # if set -l job_count (jobs | wc -l) && test -n (jobs -lp)
    #     printf (set_color blue)'[%s] ' $job_count
    # end
    # Prompt
    set_color red
    printf '%s@%s %s%s%s %s ' $USER (set_color blue)$hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color red) $user_char
end


# source ~/.config/fish/scripts/fzf-config.fish
