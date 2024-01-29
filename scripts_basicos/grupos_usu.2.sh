#!/bin/bash
groups $1 | tr ' ' '\n' | tail -n +3
