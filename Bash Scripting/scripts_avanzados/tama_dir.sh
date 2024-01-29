#!/bin/bash
if [ -z $1 ]; then
	read -p "Dime un nombre de usuario: " usuario
	sudo ls -lh /home/$usuario | head -n 1
else
	sudo ls -lh /home/$1 | head -n 1
fi
