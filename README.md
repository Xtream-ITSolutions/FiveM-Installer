# **Installer Scripts for Server Setup**

Welcome to the **Xtream-ITSolutions UG** Installer Scripts repository!  
This collection of scripts is designed to simplify the setup and management of essential services on **Debian-based** servers. Whether you're setting up a **FiveM** server, **Gitea** for Git hosting, or a **LAMP** stack with **phpMyAdmin**, these scripts will save you time and effort.

---

## **Scripts Overview**

### 1. **FiveM Installer**
Effortlessly set up your **FiveM** server.  
**Features:**  
- Downloads the latest **FiveM** artifacts.  
- Configures **crontab** for auto-restart on server reboot.  
- Prepares the server for immediate use.

**How to Use:**  
Run the `fivem-installer.sh` script and follow the prompts.

---

### 2. **Gitea Installer**
Set up **Gitea**, the lightweight and powerful Git hosting solution.  
**Features:**  
- Installs **Gitea version 1.21.8**.  
- Sets up required directories and permissions.  
- Configures a **systemd service** for automatic startup.

**How to Use:**  
Run the `gitea-installer.sh` script, and Gitea will be ready in minutes.

---

### 3. **LAMP Stack and phpMyAdmin Installer**
Quickly deploy a fully functional **LAMP** stack with **phpMyAdmin**.  
**Features:**  
- Installs **Apache2**, **PHP 7.4**, and **MariaDB**.  
- Downloads and configures **phpMyAdmin**.  
- Secures **MySQL** with a randomly generated admin password.

**How to Use:**  
Run the `lamp-phpmyadmin-installer.sh` script to set up the environment.

---

## **Installation Guide**

### Prerequisites
- A **Debian-based** operating system (e.g., Debian 11/12).  
- **Root or sudo privileges**.  
- **Stable internet connection**.

### Steps to Install

1. **Clone the repository**:  
   Clone the repository to your server:
   ```bash
   git clone https://github.com/Xtream-ITSolutions/installer-scripts.git
   cd installer-scripts