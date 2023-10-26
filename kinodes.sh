#! /usr/bin/bash

back="~/projects/go/src/kinodes"
front="~/projects/code/kinodesFront"

kitty @ launch --type os-window --title EDIT --tab-title "BACK" --cwd "$back" nvim '.' 
kitty @ launch --type tab --title EDIT --tab-title FRONT --cwd "$front" nvim '.' 

kitty @ launch --type os-window --title PROCESS --tab-title "AIR" --cwd "$back" air
kitty @ launch --type tab --title PROCESS --tab-title "PNPM" --cwd "$front" pnpm run dev
