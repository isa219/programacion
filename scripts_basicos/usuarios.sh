#!/bin/bash
cat /etc/passwd | grep 'nologin\|false' | cut -d: -f1
