export PATH="${PATH}:~/bin"
export JAVA_HOME=/opt/default-jdk
export EDITOR="vim"
alias bitlocker="sudo bash /usr/local/sbin/bitlocker"
alias monitorpacman="teste=0; while [[ ${teste} -eq 0 ]]; do sleep 15; pgrep pacman; teste=$?;done; notify-send 'PACMAN terminou'"
