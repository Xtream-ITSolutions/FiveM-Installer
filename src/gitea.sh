#!/bin/bash

# Gitea Installer Script
# Dieses Skript installiert Gitea (Git mit einer Tasse Tee) auf einem Linux-System.

# Version von Gitea, die installiert werden soll
GITEA_VERSION="1.21.8"

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
echo -e "${SUCCESS}✅ Gitea Installer ${RESET}"
echo -e "${INFO}Installiert Gitea $GITEA_VERSION auf Ihrem System...${RESET}"

# System-Update und -Upgrade
echo -e "${INFO}🔄 Aktualisiere das System...${RESET}"
sudo apt update && sudo apt upgrade -y || error_exit "System konnte nicht aktualisiert werden."

# Installation von Abhängigkeiten
echo -e "${INFO}🔧 Installiere erforderliche Pakete (git, openssh-server)...${RESET}"
sudo apt install -y git openssh-server || error_exit "Pakete konnten nicht installiert werden."

# Benutzer für Gitea erstellen
echo -e "${INFO}👤 Erstelle Benutzer und Verzeichnisse für Gitea...${RESET}"
sudo adduser --system --shell /bin/bash --gecos 'Git Version Control' --group --disabled-password --home /home/git git || error_exit "Benutzer 'git' konnte nicht erstellt werden."

# Herunterladen der Gitea-Binärdatei
echo -e "${INFO}⬇️ Lade Gitea $GITEA_VERSION herunter...${RESET}"
wget -O gitea https://dl.gitea.io/gitea/${GITEA_VERSION}/gitea-${GITEA_VERSION}-linux-amd64 || error_exit "Gitea konnte nicht heruntergeladen werden."

# Berechtigungen für die Binärdatei setzen und verschieben
echo -e "${INFO}⚙️ Richte Gitea-Binärdatei ein...${RESET}"
chmod +x gitea
sudo mv gitea /usr/local/bin/gitea || error_exit "Gitea-Binärdatei konnte nicht verschoben werden."

# Verzeichnisse für Gitea erstellen
echo -e "${INFO}📂 Erstelle Verzeichnisse für Gitea...${RESET}"
sudo mkdir -p /var/lib/gitea/{custom,data,indexers,public,log}
sudo chown git:git /var/lib/gitea/{data,indexers,log}
sudo chmod 750 /var/lib/gitea/{data,indexers,log}
sudo mkdir -p /etc/gitea
sudo chown root:git /etc/gitea
sudo chmod 770 /etc/gitea

# Systemd-Service erstellen
echo -e "${INFO}🛠️ Erstelle Systemd-Service für Gitea...${RESET}"
cat <<EOF | sudo tee /etc/systemd/system/gitea.service > /dev/null
[Unit]
Description=Gitea (Git with a cup of tea)
After=syslog.target
After=network.target

[Service]
RestartSec=2s
Type=simple
User=git
Group=git
WorkingDirectory=/var/lib/gitea/
ExecStart=/usr/local/bin/gitea web -c /etc/gitea/app.ini
Restart=always
Environment=USER=git HOME=/home/git GITEA_WORK_DIR=/var/lib/gitea

[Install]
WantedBy=multi-user.target
EOF

# Gitea-Dienst aktivieren und starten
echo -e "${INFO}⚡ Aktiviere und starte Gitea-Dienst...${RESET}"
sudo systemctl enable gitea || error_exit "Gitea konnte nicht aktiviert werden."
sudo systemctl start gitea || error_exit "Gitea konnte nicht gestartet werden."

# Erfolgsnachricht
echo -e "${SUCCESS}🎉 Gitea $GITEA_VERSION wurde erfolgreich installiert!${RESET}"
echo -e "${INFO}Zugriff auf Gitea über: http://<server-ip>:3000${RESET}"
