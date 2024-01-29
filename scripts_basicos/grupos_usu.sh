#!/bin/bash
read -p "Dime un nombre de usuario: " usuario
groups $usuario | tr ' ' '\n' | tail -n +3
