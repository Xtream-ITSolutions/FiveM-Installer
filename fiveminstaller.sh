#!/bin/bash

# FiveM Linux Installer
# Dieses Skript installiert die FiveM-Serverartifacts und richtet Screen und Crontab für den automatischen Start ein.

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
echo -e "${GREEN}FiveM Linux Installer${RESET}"

# System-Update und -Upgrade
echo "Aktualisiere das System..."
sudo apt update && sudo apt upgrade -y || error_exit "System konnte nicht aktualisiert werden."

# Benötigte Pakete installieren
echo "Installiere benötigte Pakete (xf und tar)..."
sudo apt install -y xf tar || error_exit "Pakete konnten nicht installiert werden."

# Erstellen des Serververzeichnisses
echo "Erstelle Verzeichnisstruktur für FiveM..."
mkdir -p /home/FiveM/server || error_exit "Verzeichnis konnte nicht erstellt werden."
cd /home/FiveM/server || error_exit "Konnte nicht in das Verzeichnis wechseln."

# Link zu den FiveM-Artifacts anfordern
echo -n "Geben Sie den Link zu den FiveM-Artifakten ein: "
read -r link
wget "$link" -O fx.tar.xz || error_exit "FiveM-Artifakte konnten nicht heruntergeladen werden."

# Artifacts entpacken
echo "Entpacke die FiveM-Dateien..."
tar xf fx.tar.xz || error_exit "Dateien konnten nicht entpackt werden."
echo -e "${GREEN}Artifacts erfolgreich installiert!${RESET}"

# Alte Archivdatei entfernen
rm -r fx.tar.xz

# Installation von Screen
echo "Installiere Screen..."
sudo apt install -y screen || error_exit "Screen konnte nicht installiert werden."

# Crontab für automatischen Start einrichten
echo "Richte Crontab für den automatischen Start ein..."
(crontab -l 2>/dev/null; echo "@reboot /bin/bash /home/FiveM/server/run.sh > /home/FiveM/server/cron.log 2>&1") | crontab - || error_exit "Crontab konnte nicht eingerichtet werden."

# Hinweis zur manuellen Ausführung
echo -e "${GREEN}Erfolgreich installiert!${RESET}"
echo "Wechseln Sie in den Server-Ordner mit:"
echo -e "${GREEN}cd /home/FiveM/server${RESET}"
echo "Starten Sie den Server mit:"
echo -e "${GREEN}./run.sh${RESET}"

echo -e "Ein Crontab wurde erfolgreich eingerichtet. Nach einem Serverneustart wird FiveM/TxAdmin automatisch gestartet."
echo -e "${GREEN}Installation abgeschlossen!${RESET}"
