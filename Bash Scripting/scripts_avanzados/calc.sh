#!/bin/bash
if [ $# -lt 2 ]; then
	if [ $# -eq 1 ];then
		read -p "Dime el otro número: " otro_numero
		n1_es_numero=`echo $1 | grep -vE [a-z]`
        	n2_es_numero=`echo $otro_numero | grep -vE "[a-z]"`
		if [ -n n1_es_numero ] && [ -n n2_es_numero ]; then
                        suma=$(($1+otro_numero))
                        resta=$(($1-otro_numero))
                        mult=$(($1*otro_numero))
                        div=$(($1/otro_numero))
                        echo Suma: $suma
                        echo Resta: $resta
                        echo Multiplicación: $mult
                        echo Division: $div
		fi
	else
        	read -p "Dime un numero: " n1
         	read -p "Dime otro número: " n2
		n1_es_numero=`echo $1 | grep -vE "[a-z]"`
        	n2_es_numero=`echo $2 | grep -vE "[a-z]"`
         	if [ -n n1_es_numero ] && [ -n n2_es_numero ]; then
                         suma=$((n1+n2))
                         resta=$((n1-n2))
                         mult=$((n1*n2))
                         div=$((n1/n2))
                         echo Suma: $suma
                         echo Resta: $resta
                         echo Multiplicación: $mult
                         echo Division: $div
                 else
                         echo No has metido números en los parametros
                 fi
	fi
elif [ $# -gt 2 ]; then
        echo Escribe solo 2 parametros
else
        n1_es_numero=`echo $1 | grep -vE "[a-z]"`
        n2_es_numero=`echo $2 | grep -vE "[a-z]"`
                if [ -n n1_es_numero ] && [ -n n2_es_numero ]; then
                        suma=$(($1+$2))
                        resta=$(($1-$2))
                        mult=$(($1*$2))
                        div=$(($1/$2))
                        echo Suma: $suma
                        echo Resta: $resta
                        echo Multiplicación: $mult
                        echo Division: $div
                else
                        echo No has metido números en los parametros
                fi
fi
