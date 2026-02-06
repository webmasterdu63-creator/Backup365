# Backup365
Automatisation de sauvegardes Windows &amp; Linux 
# Backup365

<p align="center">
  <img src="https://github.com/webmasterdu63-creator/Backup365/blob/main/CloudBackup365.jpg" width="200" alt="Backup365 Logo">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/OS-Windows%20%7C%20Linux-blue" alt="OS Support">
  <img src="https://img.shields.io/badge/Frequency-Daily%20%2F%20365-brightgreen" alt="Frequency">
  <img src="https://img.shields.io/badge/Type-Automated%20Backup-orange" alt="Type">
</p>

Backup365/
├── src/                # Code source principal
│   ├── core/           # Logique de connexion et authentification
│   ├── modules/        # Modules spécifiques (OneDrive, Outlook, SharePoint)
│   └── utils/          # Fonctions d'aide (logs, gestion des dates, etc.)
├── config/             # Fichiers de configuration (ex: config.yaml.example)
├── backups/            # Dossier local par défaut pour les exports (ignoré par git)
├── tests/              # Tests unitaires pour vérifier la fiabilité
├── docs/               # Documentation détaillée et captures d'écran
├── .gitignore          # Pour exclure les fichiers sensibles (.env, backups/)
├── requirements.txt    # Dépendances (si Python) ou package.json (si JS)
└── README.md           # Guide d'installation et d'utilisation

## 🛡️ About Backup365
**Backup365** is a modern automation tool designed to ensure your data is safe every day of the year. It handles scheduled backups for both Windows and Linux environments with ease.
