#!/bin/bash
read -p "Dime el nombre de un usuario: " usuario
sudo crontab -u $usuario -l
