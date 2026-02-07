#!/bin/bash
echo "Backup365 - Script Linux chargé."

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


