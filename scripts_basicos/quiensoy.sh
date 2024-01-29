#!/bin/bash
echo Usuario: $USER
echo Directorio de conexion: $HOME 
a=`chage -l $USER | grep -E 'Password expires|Account expires' | cut -d' ' -f3 | head -n 1`
b=`chage -l $USER | grep -E 'Password expires|Account expires' | cut -d' ' -f3 | tail -n 1`
echo La contraseña expira: $a
echo La cuenta expira: $b
