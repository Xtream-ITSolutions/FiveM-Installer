# **Installer-Skripte für die Servereinrichtung** 🚀

Willkommen im **Xtream-ITSolutions UG** Installer-Skripte Repository!  
Diese Sammlung von Skripten wurde entwickelt, um die Einrichtung und Verwaltung von wichtigen Diensten auf **Debian-basierten** Servern zu vereinfachen. Ob du einen **FiveM**-Server einrichtest, **Gitea** für Git-Hosting nutzt oder einen **LAMP**-Stack mit **phpMyAdmin** bereitstellst – diese Skripte sparen dir Zeit und Aufwand. ⏳

---

## **Übersicht der Skripte** 🔧

### 1. **FiveM-Installer** 🎮
Richte deinen **FiveM**-Server mühelos ein.  
**Funktionen:**  
- Lädt die neuesten **FiveM**-Artefakte herunter.  
- Konfiguriert **crontab** für den automatischen Neustart des Servers bei einem Neustart.  
- Bereitet den Server für die sofortige Nutzung vor.

**Verwendung:**  
Führe das Skript `fivem-installer.sh` aus und folge den Anweisungen.

---

### 2. **Gitea-Installer** 🖥️
Installiere **Gitea**, die leichte und leistungsstarke Git-Hosting-Lösung.  
**Funktionen:**  
- Installiert **Gitea Version 1.21.8**.  
- Richtet benötigte Verzeichnisse und Berechtigungen ein.  
- Konfiguriert einen **systemd-Dienst** für den automatischen Start.

**Verwendung:**  
Führe das Skript `gitea-installer.sh` aus, und Gitea ist in wenigen Minuten einsatzbereit.

---

### 3. **LAMP-Stack und phpMyAdmin-Installer** 🌐
Stelle schnell einen voll funktionsfähigen **LAMP**-Stack mit **phpMyAdmin** bereit.  
**Funktionen:**  
- Installiert **Apache2**, **PHP 7.4** und **MariaDB**.  
- Lädt **phpMyAdmin** herunter und konfiguriert es.  
- Sichert **MySQL** mit einem zufällig generierten Admin-Passwort.

**Verwendung:**  
Führe das Skript `lamp-phpmyadmin-installer.sh` aus, um die Umgebung einzurichten.

---

## **Installationsanleitung** 📦

### Voraussetzungen ✅
- Ein **Debian-basiertes** Betriebssystem (z.B. Debian 11/12).  
- **Root- oder sudo-Rechte**.  
- Eine **stabile Internetverbindung**.

### Installationsschritte 📋

1. **Repository klonen:**  
   Klone das Repository auf deinen Server:
   ```bash
   git clone https://github.com/Xtream-ITSolutions/fivem-installer.git
   cd fivem-installer


### Wähle das Skript, das du benötigst:  
Wähle das Skript, das du installieren möchtest:

- `fivem-installer.sh` für **FiveM**
- `gitea-installer.sh` für **Gitea**
- `lamp-phpmyadmin-installer.sh` für **LAMP und phpMyAdmin**

---

### Skript ausführbar machen:  
Mache das gewählte Skript ausführbar:

```bash
   chmod +x <skript-name>.sh


### Skript ausführen:  
Führe das Skript mit **root-Rechten** aus:
   sudo ./<skript-name>.sh

---

### **Support und Kontakt** 📞  
Benötigst du Hilfe? Wende dich an uns!  
Wir bieten Support für alle unsere Skripte und Dienste.

- **Website:** [www.xtream-itsolutions.com](https://www.xtream-itsolutions.com)  
- **Discord-Community:** [Tritt uns auf Discord bei](https://discord.gg/kRSyAybbby)  
- **E-Mail:** [support@xtream-itsolutions.com](mailto:support@xtream-itsolutions.com)

---

### **Mitwirken** 🤝  
Möchtest du zum Projekt beitragen? Wir freuen uns über deine Unterstützung!  
Folge diesen Schritten:

1. Forke das Repository.
2. Klone dein Fork auf deinen lokalen Computer.
3. Erstelle einen neuen Branch für deine Änderungen.
4. Nimm deine Änderungen vor und stelle sicher, dass sie den Projekt-Richtlinien entsprechen.
5. Push deine Änderungen auf dein Fork.
6. Erstelle einen Pull Request, um deine Änderungen zu beschreiben.

---

### **Haftungsausschluss** ⚠️  
Diese Skripte werden von **Xtream-ITSolutions UG** zur Vereinfachung der Servereinrichtung bereitgestellt. Es wird empfohlen, sie zunächst in einer Testumgebung zu testen, bevor sie auf produktiven Systemen eingesetzt werden.

- **Haftungsausschluss:** Xtream-ITSolutions UG übernimmt keine Verantwortung für etwaige Probleme, die durch die Nutzung dieser Skripte entstehen.  
- **Backups:** Stelle sicher, dass du ordnungsgemäße Backups und Server-Snapshots erstellt hast, bevor du irgendwelche Installationsskripte ausführst.

---

### **Lizenz** 📜

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)  
[![License](https://img.shields.io/badge/License-Boost_1.0-lightblue.svg)](https://www.boost.org/LICENSE_1_0.txt)  
[![License: CC0-1.0](https://img.shields.io/badge/License-CC0_1.0-lightgrey.svg)](http://creativecommons.org/publicdomain/zero/1.0/)  
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)  
[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC_BY--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

---

**© 2025 Xtream-ITSolutions UG. Alle Rechte vorbehalten.**
