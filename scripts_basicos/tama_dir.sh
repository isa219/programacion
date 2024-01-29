#!/bin/bash
read -p "Dime un nombre de usuario: " usuario
sudo ls -lh /home/$usuario | head -n 1
