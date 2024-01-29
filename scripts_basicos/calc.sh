#!/bin/bash
read -p "Dime un número: " n1
read -p "Dime otro número: " n2
suma=$((n1+n2))
resta=$((n1-n2))
multiplicacion=$((n1*n2))
division=$((n1/n2))
echo Suma: $suma
echo Resta: $resta
echo Multiplicación: $multiplicacion
echo Division: $division
