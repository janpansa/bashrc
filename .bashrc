#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='↳\[\e[0;96m\] \u@\h \W \[\e[0m\]\$  '

alias joypad='cd /home/gideon/Gideon\ Scripts/Joypad\ Keyboard\ mapping/ && sh /home/gideon/Gideon\ Scripts/Joypad\ Keyboard\ mapping/JavaJoystickToKey-Linux64bit.sh'
alias sync='do pacman -Sy'
alias extract='tar -zxvf'

# Pacman aliases Gideon
# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;\$!ba;s/\n/ /g')"
