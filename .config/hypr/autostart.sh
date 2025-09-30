#!/bin/bash

# Workspace 1: Terminal
hyprctl dispatch workspace 1
alacritty &

# Workspace 2: Browser
hyprctl dispatch workspace 2
brave-browser &

# Workspace 3: VS Code
hyprctl dispatch workspace 3
code &

# Workspace 4: Browser for Communication
hyprctl dispatch workspace 4
brave-browser &

# Workspace 5: Browser for Music
hyprctl dispatch workspace 5
brave-browser &
