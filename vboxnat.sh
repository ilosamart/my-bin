#!/bin/bash
case $1 in
	start)
		sudo sysctl net.ipv4.ip_forward=1
		sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
		for iface in wlp2s0 enp3s0; do
			sudo iptables -t nat -A POSTROUTING -o $iface -j MASQUERADE
			sudo iptables -A FORWARD -i vboxnet0 -o $iface -j ACCEPT
		done
		echo ""
	;;
	stop)
		sudo sysctl net.ipv4.ip_forward=0
		sudo iptables -D FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
		for iface in wlp2s0 enp3s0; do
			sudo iptables -t nat -D POSTROUTING -o $iface -j MASQUERADE
	 		sudo iptables -A FORWARD -i vboxnet0 -o $iface -j ACCEPT
		done
	;;
	*)
		echo "Usage:"
		echo "$0 [start|stop]"
esac
