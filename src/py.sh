#!/bin/bash

# Farben für Benutzerfeedback
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"
INFO="\033[0;36m"
SUCCESS="\033[0;32m"
WARNING="\033[0;33m"
ERROR="\033[0;31m"

# Funktion zur Fehlerbehandlung
error_exit() {
    echo -e "${ERROR}❌ [ERROR] $1${RESET}" >&2
    exit 1
}

# Begrüßungsnachricht
echo -e "${SUCCESS}✅ Python3 + Pip3 Installer ${RESET}"

# System-Update und -Upgrade
echo -e "${INFO}🔄 Aktualisiere das System...${RESET}"
sudo apt update && sudo apt upgrade -y || error_exit "System konnte nicht aktualisiert werden."

# Installation von Python3 und Pip3
echo -e "${INFO}📦 Installiere Python3 und Pip3...${RESET}"
sudo apt install -y python3 python3-pip || error_exit "Python3 und/oder Pip3 konnten nicht installiert werden."

# Installation von Screen
echo -e "${INFO}🖥️ Installiere Screen...${RESET}"
sudo apt install -y screen || error_exit "Screen konnte nicht installiert werden."

# Abschlussnachricht
echo -e "${SUCCESS}🎉 Python3 und Pip3 wurden erfolgreich installiert! ${RESET}"
echo -e "${INFO}Starte deinen Bot mit: ${GREEN}python3 bot.py${RESET}"
echo -e "${INFO}Benötigst du zusätzliche Packages wie py-cord? Installiere sie mit: ${GREEN}pip3 install py-cord${RESET}"
echo -e "${INFO}Support findest du unter: ${GREEN}https://discord.gg/kRSyAybbby${RESET}"
