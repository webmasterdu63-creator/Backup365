#!/bin/bash
echo "Backup365 - Script Linux chargé."
foreach ($folder in $folders) {
    Write-Host "Analyse du dossier : $folder"

    Get-ChildItem -Path $folder -Recurse -File | Where-Object {
        $extensions -contains $_.Extension.ToLower()
    } | ForEach-Object {
        $target = Join-Path $destination $_.Name
        Copy-Item -Path $_.FullName -Destination $target -Force
        Write-Host "Copié : $($_.FullName)"
    }
}

