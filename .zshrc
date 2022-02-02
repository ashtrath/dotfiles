###     ZSH SETTINGS      ###
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
plugins=(
	zsh-autosuggestions
  zsh-completions
  zbell
	fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
setopt GLOB_DOTS
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_BEEP

stty -ixon
stty erase "^?"

# Make nvim the default editor
export EDITOR='nvim'
export VISUAL='nvim'

# Change sudo prompt
export SUDO_PROMPT="$(printf "\033[1;31mPassword : \033[0;0m" )"

###     ZBELL SETTINGS     ###
zbell_ignore=(
  $EDITOR
  $PAGER
  $VISUAL
  mpsyt
  cava
  configs
)

###   TERMINAL SETTINGS   ###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Replace ls with exa
alias ls='exa --icons'
alias la='exa -a --icons'
alias ll='exa -la --icons'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='rg'

# use Bottom instead top
alias top='btm'

# Replace cat with bat
alias cat='bat --theme "base16"'

#readable output
alias df='df -h'

# set :q to exit terminal just like vim
alias :q='exit'


# LF (ranger like filemanager but written on Golang)
alias lf='lf-ueberzug'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

# make mount output command more readable
alias mount="mount | column -t"

#merge new settings
alias merge="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

#hardware info --short
alias hw="hwinfo --short"

#skip yay integrity check
alias yayskip='yay -S --mflags --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nvim for important configuration files
alias nleftwm="cd $HOME/.config/leftwm && $EDITOR config.toml"
alias nvimconfig="cd $HOME/.config/nvim && $EDITOR init.vim"
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"
alias nx="$EDITOR ~/.Xresources"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# Spotify-TUI
spt() {
  pkill spotifyd
  spotifyd
  command spt
}

# Make manpage looks nicer
man () {
  LESS_TERMCAP_mb=$'\e[1;34m'   \
  LESS_TERMCAP_md=$'\e[1;34m'   \
  LESS_TERMCAP_me=$'\e[0m'      \
  LESS_TERMCAP_so=$'\e[01;35m'  \
  LESS_TERMCAP_se=$'\e[0m'      \
  LESS_TERMCAP_us=$'\e[1;32m'   \
  LESS_TERMCAP_ue=$'\e[0m'      \
  command man "$@"
}

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.asar)      asar extract $1 unpacked;;
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#remove
alias rmgitcache="rm - ~/.cache/git"

# Run neofetch at startup for cool shit
# Prevent neofetch running on neovim terminal
if [ ! $IN_NEOVIM ]; then
  cfetch
fi

# Run Starship prompt
eval "$(starship init zsh)"
