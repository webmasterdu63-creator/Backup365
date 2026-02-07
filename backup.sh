#!/bin/bash
echo "Backup365 - Script Linux chargé."
logfile="./backup.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$logfile"
}
# Rotation des logs : garder 7 jours max
find . -name "backup.log.*" -mtime +7 -delete

# Renommer l'ancien log avec la date du jour
if [[ -f "backup.log" ]]; then
    mv backup.log "backup.log.$(date '+%Y-%m-%d')"
fi

# Nouveau fichier log
logfile="./backup.log"

config_file="../../config.json"

# Lecture des extensions autorisées
allowed_ext=($(jq -r '.allowed_extensions[]' "$config_file"))

# Lecture des dossiers à sauvegarder
folders=($(jq -r '.folders_to_backup[]' "$config_file"))

# Destination de sauvegarde
destination=$(jq -r '.backup_destination' "$config_file")

for folder in "${folders[@]}"; do
    echo "Analyse du dossier : $folder"

    find "$folder" -type f | while read -r file; do
        ext=".$(echo "${file##*.}" | tr 'A-Z' 'a-z')"

        if printf '%s\n' "${allowed_ext[@]}" | grep -q "^$ext$"; then
            cp "$file" "$destination"
            echo "Copié : $file"
        fi
    done
done
#!/bin/bash
echo "Backup365 - Script Linux chargé."

# Mode dry-run
dryrun=false
if [[ "$1" == "--dry-run" ]]; then
    dryrun=true
    echo "[MODE DRY-RUN ACTIVÉ]"
fi

config_file="../../config.json"

allowed_ext=($(jq -r '.allowed_extensions[]' "$config_file"))
folders=($(jq -r '.folders_to_backup[]' "$config_file"))
destination=$(jq -r '.backup_destination' "$config_file")

for folder in "${folders[@]}"; do
    echo "Analyse du dossier : $folder"

    find "$folder" -type f | while read -r file; do
        ext=".$(echo "${file##*.}" | tr 'A-Z' 'a-z')"

        if printf '%s\n' "${allowed_ext[@]}" | grep -q "^$ext$"; then
            
            if $dryrun; then
                echo "[DRY-RUN] $file -> $destination"
            else
                cp "$file" "$destination"
                echo "Copié : $file"
            fi

        fi
    done
done
archive_name="backup-$(date '+%Y-%m-%d').tar.gz"

echo "Compression de la sauvegarde en cours..."
tar -czf "$archive_name" -C "$destination" .
log "Archive créée : $archive_name"
echo "Archive créée : $archive_name"

