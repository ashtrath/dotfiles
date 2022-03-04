set -gx FISH_CONFIG_DIR $HOME/.config/fish
set -g fish_greeting

set -g fish_prompt_pwd_dir_length 0

if status is-interactive
  # Do something if running interactively
end

# Source PATH
set PATH $HOME/.local/bin $PATH

# Make neovim as default editor/visual.
set -x EDITOR nvim
set -x VISUAL nvim

# Custom sudo prompt
set -x SUDO_PROMPT (printf "\033[1;31mPassword : \033[0;0m" )

# Alias for neovim
alias v="nvim"

# Replace ls with exa
alias ls="exa --icons"
alias la='exa -a --icons'
alias ll='exa -la --icons'

# Replace sed with sd
alias sed='sd'

# Colorize the grep command output for ease of use (good for log files)
alias grep='rg'

# use Bottom instead top
alias top='btm --color default-light'

# Replace cat with bat
alias cat='bat --theme "base16"'

#readable output
alias df='df -h'

# set :q to exit terminal just like vim
alias :q='exit'

# pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

# free
alias free="free -mt"

# Git utility
alias gc="git clone"
alias g="git"
alias ga.="git add ."
alias ga="git add"
alias gb="git branch"
alias gbdelete="git branch -D"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gm="git merge"
alias gpull="git pull"
alias gpsh="git push"
alias gpshu="git push -U origin master"
alias gs="git status"
alias gd="git diff"

# continue download
alias wget="wget -c"

# userlist
alias userlist="cut -d: -f1 /etc/passwd"

# make mount output command more readable
alias mount="mount | column -t"

# merge new settings
alias merge="xrdb merge ~/.Xresources && pkill -USR1 -x st"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# add new fonts
alias update-fc='sudo fc-cache -fv'

# switch between bash and zsh
alias tofish="sudo chsh $USER -s /usr/bin/fish && echo 'Now log out.'"
alias tobash="sudo chsh $USER -s /usr/bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /usr/bin/zsh && echo 'Now log out.'"

# hardware info --short
alias hw="hwinfo --short"

# check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# search content with ripgrep
alias rg="rg --sort path"

# get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# nvim for important configuration files
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

# systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

# shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# Remove git cache
alias rmgitcache="rm - ~/.cache/git"

if test -z $IN_NEOVIM=0
  cfetch
end

# Run Starship prompt
starship init fish | source
