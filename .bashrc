#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='↳\[\e[0;96m\] \u@\h \W \[\e[0m\]\$  '

#-----------------------------
# ssh-agent aliases
#-----------------------------

# 1 - maak seker net een ssh-agent run
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

alias ssh-add="ssh-add -l | grep 'The agent has no identities' && ssh-add"

# 2 - check elke keer as ons ssh gebruik of ssh-add al gerun het hierdie session.
alias ssh="ssh-add ; ssh"

#-----------------------------

alias joypad='cd /home/gideon/Gideon\ Scripts/Joypad\ Keyboard\ mapping/ && sh /home/gideon/Gideon\ Scripts/Joypad\ Keyboard\ mapping/JavaJoystickToKey-Linux64bit.sh'
alias sync='do pacman -Sy'
alias extract='tar -zxvf'

# Pacman aliases Gideon
# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;\$!ba;s/\n/ /g')"

#-----------------------------
# docker aliases
#-----------------------------

# Start a Drupal 7 Dev Enviroment
#
# 1 - This runs a docker image (drupal 7.x) from the julianlab repo.
# 2 - rm 		Automatically remove the container when it exits
# 3 - name 		Assign a name to the container (d7_dev)
# 4 - net		Connect a container to a network (drupal_default)
# 5 - volumes-from	Mount volumes from the specified container(s) (drupal_apache2_1)
# 6 - link		Add link to another container (drupal_mariadb_1) *This is our data container
# 7 - ti		Hy maak oop in 'n interactive shell
#

alias drupaldev7="docker run --rm --name d7_dev --net drupal_default --volumes-from drupal_apache2_1 -v /home/gideon/.ssh:/var/www/.ssh --link drupal_mariadb_1 -ti julianlab/drupal:7.x"

# Start a Drupal 8 Dev Enviroment
alias drupaldev8="docker run --rm --name d8_dev --net drupal_default --volumes-from drupal_apache2_1 -v /home/gideon/.ssh:/var/www/.ssh  --link drupal_mariadb_1 -ti julianlab/drupal:8.x"

# Node command
alias node='docker run -it --rm --name nodejs-container -p 8081:8081 -v "$PWD":/usr/src/app -w /usr/src/app node:4 node'

# NPM command
alias npm='docker run --name npm --rm -v "$PWD:/home/frontend" -p 4000:4000 -p 9000:9000 -p 35729:35729 -ti julianlab/frontend_developer npm'

# Hugo command
alias hugo='docker run --name hugo --rm -v "$PWD:/home/frontend" -p 4000:4000 -p 9000:9000 -p 35729:35729 julianlab/frontend_developer dumb-init hugo'

# Grunt command
alias grunt='docker run --name grunt --rm -v "$PWD:/home/frontend" -p 4000:4000 -p 9000:9000 -p 35729:35729 julianlab/frontend_developer dumb-init grunt'

# Gulp command
alias gulp='docker run --name gulp --rm -v "$PWD:/home/frontend" -p 4000:4000 -p 9000:9000 -p 35729:35729 julianlab/frontend_developer dumb-init gulp'

# Bower command
alias bower='docker run --rm -v "$PWD:/home/frontend" -p 4000:4000 -p 9000:9000 -p 35729:35729 -ti julianlab/frontend_developer bower'

#-----------------------------
