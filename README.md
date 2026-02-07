# Backup365 - Automatisation des Sauvegardes Windows &amp; Linux 
# Backup365 – Automated Backup System for Windows & Linux

  <img src="https://github.com/webmasterdu63-creator/Backup365/blob/main/CloudBackup365.jpg" width="200" alt="Backup365 Logo">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/OS-Windows%20%7C%20Linux-blue" alt="OS Support">
  <img src="https://img.shields.io/badge/Frequency-Daily%20%2F%20365-brightgreen" alt="Frequency">
  <img src="https://img.shields.io/badge/Type-Automated%20Backup-orange" alt="Type">
</p>

# 🛡️ Backup365

**Backup365** est une solution open-source conçue pour automatiser la sauvegarde des données critiques de l'écosystème Microsoft 365 (OneDrive, Outlook, SharePoint). 

## 🚀 Fonctionnalités
* **Multi-tenant** : Support de plusieurs comptes Microsoft.
* **Sécurisé** : Authentification via Azure AD (OAuth 2.0).
* **Flexible** : Sauvegarde locale ou vers un stockage Cloud (S3, Azure Blob).
* **Logging** : Rapports détaillés après chaque exécution.

## 🏗️ Architecture du Projet
Le schéma ci-dessous illustre le flux de données entre Microsoft Graph API et votre stockage local :



## 🛠️ Installation

1. **Cloner le projet**
   ```bash
   git clone [https://github.com/webmasterdu63-creator/Backup365.git](https://github.com/webmasterdu63-creator/Backup365.git)
   cd Backup365

   Installer les dépendances (Exemple pour Python)
   pip install -r requirements.txt
🔐 GitHub Access: SSH vs Token (Short & Essential Guide)
1. HTTPS + Personal Access Token (Legacy Method)

How it works  
You clone using an HTTPS URL:
https://github.com/username/repo.git

Git asks for a password → you must provide a Personal Access Token (PAT).

Drawbacks

    Token expires or must be regenerated

    Not suitable for automation (cron, systemd, scripts)

    Requires re-authentication

    Less convenient for professional workflows

2. SSH Authentication (Recommended)

How it works  
You clone using an SSH URL:
Code

git@github.com:username/repo.git

Your machine uses a private key, and GitHub stores the public key.

Benefits

    No token required

    No password prompts

    Perfect for automation

    Secure and stable

    One-time setup

3. Generate an SSH Key (Linux)
Code

ssh-keygen -t ed25519 -C "your_github_email"

Press Enter for all prompts.

Your keys will be created in:

    ~/.ssh/id_ed25519 (private key)

    ~/.ssh/id_ed25519.pub (public key)

4. Add Your Public Key to GitHub

    Display your public key:

Code

cat ~/.ssh/id_ed25519.pub

    Copy the output

    Go to GitHub → Settings → SSH and GPG keys → New SSH key

    Paste the key and save

5. Test SSH Authentication
Code

ssh -T git@github.com

Expected output:
Code

Hi username! You've successfully authenticated, but GitHub does not provide shell access.

This confirms SSH is working.
6. Clone Using SSH
Code

git clone git@github.com:username/repo.git

No token, no password, no prompts.
7. Common Issues & Fixes
❌ “Permission denied (publickey)”

    No SSH key on the machine

    Wrong key added to GitHub

    Using HTTPS instead of SSH

Fix: regenerate the key and add the public key to GitHub.
❌ GitHub asks for a token again

You are still using an HTTPS URL.

Fix: switch to SSH:
Code

git remote set-url origin git@github.com:username/repo.git

❌ Email verification code not working

    Use the latest code

    Check Spam / Promotions

    Ensure your GitHub email is Verified

    Log out / log in again if needed

8. Summary

    HTTPS + Token = works, but not ideal

    SSH = secure, automated, professional

    Once SSH is configured → no more tokens ever
   
## 🛡️ About Backup365
**Backup365** is a modern automation tool designed to ensure your data is safe every day of the year. It handles scheduled backups for both Windows and Linux environments with ease.
