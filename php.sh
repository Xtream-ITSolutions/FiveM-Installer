#!/bin/bash

# Farben für Benutzerfeedback
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

# Funktion zur Fehlerbehandlung
error_exit() {
    echo -e "${RED}[ERROR] $1${RESET}" >&2
    exit 1
}

# Begrüßungsnachricht
echo -e "${GREEN}Apache, PHP, MariaDB und phpMyAdmin Installer${RESET}"

# System-Update und -Upgrade
echo "Aktualisiere das System..."
sudo apt update && sudo apt upgrade -y || error_exit "System konnte nicht aktualisiert werden."

# Notwendige Pakete installieren
echo "Installiere erforderliche Pakete..."
sudo apt install -y ca-certificates apt-transport-https lsb-release gnupg curl nano pwgen unzip || error_exit "Pakete konnten nicht installiert werden."

# PHP-Repository hinzufügen
echo "Füge das PHP-Repository hinzu..."
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add - || error_exit "PHP-GPG-Key konnte nicht hinzugefügt werden."
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

# System aktualisieren
sudo apt update

# Apache2 und PHP installieren
echo "Installiere Apache2 und PHP 7.4..."
sudo apt install -y apache2 php7.4 php7.4-cli php7.4-curl php7.4-gd php7.4-intl php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-xsl php7.4-zip php7.4-bz2 libapache2-mod-php7.4 || error_exit "Apache2 oder PHP konnten nicht installiert werden."

# MariaDB installieren
echo "Installiere MariaDB..."
sudo apt install -y mariadb-server mariadb-client || error_exit "MariaDB konnte nicht installiert werden."

# phpMyAdmin herunterladen und einrichten
echo "Installiere phpMyAdmin..."
cd /usr/share || error_exit "Konnte nicht ins Verzeichnis /usr/share wechseln."
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip -O phpmyadmin.zip || error_exit "phpMyAdmin konnte nicht heruntergeladen werden."
unzip phpmyadmin.zip || error_exit "phpMyAdmin konnte nicht entpackt werden."
rm phpmyadmin.zip
sudo mv phpMyAdmin-*-all-languages phpmyadmin
sudo chmod -R 0755 phpmyadmin
sudo mkdir /usr/share/phpmyadmin/tmp/
sudo chown -R www-data:www-data /usr/share/phpmyadmin/tmp/

# Apache-Konfiguration für phpMyAdmin
echo "Konfiguriere Apache für phpMyAdmin..."
cat <<EOF | sudo tee /etc/apache2/conf-available/phpmyadmin.conf > /dev/null
Alias /phpmyadmin /usr/share/phpmyadmin

<Directory /usr/share/phpmyadmin>
    Options SymLinksIfOwnerMatch
    DirectoryIndex index.php
</Directory>

<Directory /usr/share/phpmyadmin/templates>
    Require all denied
</Directory>
<Directory /usr/share/phpmyadmin/libraries>
    Require all denied
</Directory>
<Directory /usr/share/phpmyadmin/setup/lib>
    Require all denied
</Directory>
EOF

sudo a2enconf phpmyadmin || error_exit "phpMyAdmin-Konfiguration konnte nicht aktiviert werden."
sudo systemctl reload apache2 || error_exit "Apache konnte nicht neu geladen werden."

# MySQL Benutzer erstellen und konfigurieren
echo "Erstelle MySQL-Benutzer für phpMyAdmin..."
MYSQL_PASS=$(pwgen -s 40 1)
sudo mysql <<MYSQL_SCRIPT
CREATE USER 'admin'@'localhost' IDENTIFIED BY '$MYSQL_PASS';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
MYSQL_SCRIPT

# phpMyAdmin-Zugangsdaten speichern
echo "Speichere Zugangsdaten..."
IP=$(hostname -I | awk '{print $1}')
sudo touch /root/phpmyadmin-data.txt
sudo chmod 600 /root/phpmyadmin-data.txt
cat <<EOF | sudo tee /root/phpmyadmin-data.txt > /dev/null
######### PHPMYADMIN Zugang #########
Link: http://$IP/phpmyadmin
Benutzer: admin
Passwort: $MYSQL_PASS

Hostempfehlung: Hostet bei Xtream-ITSolutions UG
Discord: https://discord.gg/kRSyAybbby
Website: https://www.xtream-itsolutions.com
EOF

# Abschlussnachricht
echo -e "${GREEN}Installation abgeschlossen!${RESET}"
echo "Zugangsdaten wurden unter /root/phpmyadmin-data.txt gespeichert."
echo "Zugriff auf phpMyAdmin über: http://$IP/phpmyadmin"
