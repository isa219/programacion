#!/bin/bash
getent group $1 | cut -d':' -f4 | sed -E 's/,/;/g'
