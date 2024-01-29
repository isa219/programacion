#!/bin/bash
if [ -z $1 ]; then
	read -p "Dime un nombre de usuario: " usuario
	groups $usuario | tr ' ' '\n' | tail -n +3
else
	groups $1 | tr ' ' '\n' | tail -n +3
fi
