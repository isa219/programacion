#!/bin/bash
primero=`ps aux | head -n 2 | tail -n 3`
segundo=`ps aux | head -n 3 | tail -n 3`
tercero=`ps aux | head -n 4 | tail -n 3`
echo $primero
echo $segundo
echo $tercero
