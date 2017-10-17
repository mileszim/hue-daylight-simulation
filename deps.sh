#!/bin/bash

set -o errexit

# Install deps
apt-get -q update
apt-get install -y cowsay

# Finished
/usr/games/cowsay "Done intalling deps?"
