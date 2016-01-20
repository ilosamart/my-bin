function searchPacman() {
	pgrep pacman
	return $?
}
export LESS='-R'
export LESSOPEN='|~/bin/lessfilter %s'
export PATH="${PATH}:~/bin"
export JAVA_HOME=/opt/default-jdk
export EDITOR="vim"

alias minecraft="java -jar /opt/jogos/minecraft/launcher.jar"
alias bitlocker="sudo bash /usr/local/sbin/bitlocker"
alias monitorpacman="while searchPacman ; do sleep 15; done; notify-send 'PACMAN terminou'"
