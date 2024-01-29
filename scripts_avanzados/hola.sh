#!/bin/bash
if [ $# -eq 1 ]; then
	correcto=`cat /etc/passwd | cut -d':' -f1 | grep -E "\b$1\b"`
	if [ "$correcto" != "" ]; then
		echo "existe"
	else
		echo "No existe"
	fi
elif [ $# -lt 1 ]; then
    read -p "Dime un nombre de usuario: " usuario
    correcto=`cat /etc/passwd | cut -d':' -f1 | grep -E "\b$usuario\b"`
	if [ "$correcto" != ""  ]; then
		echo "existe --$correcto----"
        else
                echo no existe
        fi
else
	echo "añade bien la maldita variable"
fi
