#!/bin/bash
lineas=`journalctl | grep cron | grep USER | wc -l`
journalctl | grep cron | grep USER | cut -d' ' -f3
echo
echo Número de veces modificado: $lineas

