#!/bin/bash

REMOTE_ADDR=$1
# Reverse tunnel
ssh -N $1 -R 0.0.0.0:2222:localhost:22
