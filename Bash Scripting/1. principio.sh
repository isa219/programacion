#!/bin/bash 
texto="buenas" 
c=$(date +'%x') 
n1=7 
n2=3 
N3=10 
echo "Hola mundo" 
echo $texto 
echo la fecha actual es $c 
((m=n1*n2)) 
((d=m/n2)) 
echo el resultado de la multiplicación de $n1 y $n2 es $m 
echo el resultado de dividir $m entre $n2 es $d 