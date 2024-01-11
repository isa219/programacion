#!/bin/bash 
lista=(1 2 3 4 5) 
echo "${lista[*]}" 
echo "${lista[@]}" 
#igual que el anterior pero lo saca como lista 
echo "${#lista[*]}" 
#cuenta los elementos de la lista 
lista[5]=6 
#añade a la lista si no hay nada y si hay algo lo sustituye 
echo "${lista[5]}" 