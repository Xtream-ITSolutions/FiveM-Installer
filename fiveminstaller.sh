#!/bin/bash

# FiveM Linux Installer
# Dieses Skript installiert die FiveM-Serverartifacts und richtet Screen und Crontab für den automatischen Start ein.

# Farben für bessere Lesbarkeit
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
echo -e "${SUCCESS}✅ FiveM Linux Installer ${RESET}"

# System-Update und -Upgrade
echo -e "${INFO}🔄 Aktualisiere das System...${RESET}"
sudo apt update && sudo apt upgrade -y || error_exit "System konnte nicht aktualisiert werden."

# Benötigte Pakete installieren
echo -e "${INFO}🔧 Installiere benötigte Pakete (xf und tar)...${RESET}"
sudo apt install -y xf tar || error_exit "Pakete konnten nicht installiert werden."

# Erstellen des Serververzeichnisses
echo -e "${INFO}📁 Erstelle Verzeichnisstruktur für FiveM...${RESET}"
mkdir -p /home/FiveM/server || error_exit "Verzeichnis konnte nicht erstellt werden."
cd /home/FiveM/server || error_exit "Konnte nicht in das Verzeichnis wechseln."

# Link zu den FiveM-Artifacts anfordern
echo -n -e "${INFO}🔗 Geben Sie den Link zu den FiveM-Artifakten ein: ${RESET}"
read -r link
wget "$link" -O fx.tar.xz || error_exit "FiveM-Artifakte konnten nicht heruntergeladen werden."

# Artifacts entpacken
echo -e "${INFO}📦 Entpacke die FiveM-Dateien...${RESET}"
tar xf fx.tar.xz || error_exit "Dateien konnten nicht entpackt werden."
echo -e "${SUCCESS}✔️ Artifacts erfolgreich installiert!${RESET}"

# Alte Archivdatei entfernen
rm -r fx.tar.xz

# Installation von Screen
echo -e "${INFO}🖥️ Installiere Screen...${RESET}"
sudo apt install -y screen || error_exit "Screen konnte nicht installiert werden."

# Crontab für automatischen Start einrichten
echo -e "${INFO}⏲️ Richte Crontab für den automatischen Start ein...${RESET}"
(crontab -l 2>/dev/null; echo "@reboot /bin/bash /home/FiveM/server/run.sh > /home/FiveM/server/cron.log 2>&1") | crontab - || error_exit "Crontab konnte nicht eingerichtet werden."

# Hinweis zur manuellen Ausführung
echo -e "${SUCCESS}🎉 Erfolgreich installiert!${RESET}"
echo -e "${INFO}📂 Wechseln Sie in den Server-Ordner mit: ${RESET}"
echo -e "${SUCCESS}cd /home/FiveM/server${RESET}"
echo -e "${INFO}🚀 Starten Sie den Server mit: ${RESET}"
echo -e "${SUCCESS}./run.sh${RESET}"

echo -e "${INFO}💡 Ein Crontab wurde erfolgreich eingerichtet. Nach einem Serverneustart wird FiveM/TxAdmin automatisch gestartet.${RESET}"
echo -e "${SUCCESS}🔧 Installation abgeschlossen!${RESET}"
