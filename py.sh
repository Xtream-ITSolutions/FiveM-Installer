#!/bin/bash

# Python3 + Pip3 Installer Script
# Dieses Skript installiert Python3, Pip3 und Screen auf einem Debian-basierten System.

# Farben für bessere Lesbarkeit
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

# Funktion zur Fehlerbehandlung
error_exit() {
    echo -e "${RED}[ERROR] $1${RESET}" >&2
    exit 1
}

# Begrüßungsnachricht
echo -e "${GREEN}Python3 + Pip3 Installer${RESET}"

# System-Update und -Upgrade
echo "Aktualisiere das System..."
sudo apt update && sudo apt upgrade -y || error_exit "System konnte nicht aktualisiert werden."

# Installation von Python3 und Pip3
echo "Installiere Python3 und Pip3..."
sudo apt install -y python3 python3-pip || error_exit "Python3 und/oder Pip3 konnten nicht installiert werden."

# Installation von Screen
echo "Installiere Screen..."
sudo apt install -y screen || error_exit "Screen konnte nicht installiert werden."

# Abschlussnachricht
echo -e "${GREEN}Python3 und Pip3 wurden erfolgreich installiert!${RESET}"
echo -e "Starte deinen Bot mit: ${GREEN}python3 bot.py${RESET}"
echo -e "Benötigst du zusätzliche Packages wie py-cord? Installiere sie mit: ${GREEN}pip3 install py-cord${RESET}"
echo -e "Support findest du unter: ${GREEN}https://discord.gg/kRSyAybbby${RESET}"
