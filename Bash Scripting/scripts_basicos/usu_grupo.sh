#!/bin/bash
read -p "Dime un nombre de un grupo: " grupo
getent group $grupo | cut -d':' -f4 | sed -E 's/,/;/g'
