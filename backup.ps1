Write-Host "Backup365 - Script Windows chargé."
Write-Host "Backup365 - Script Windows chargé."

$config = Get-Content "../../config.json" | ConvertFrom-Json
$extensions = $config.allowed_extensions
$folders = $config.folders_to_backup
$destination = $config.backup_destination

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
param(
    [switch]$DryRun
)

Write-Host "Backup365 - Script Windows chargé."

$config = Get-Content "../../config.json" | ConvertFrom-Json
$extensions = $config.allowed_extensions
$folders = $config.folders_to_backup
$destination = $config.backup_destination

foreach ($folder in $folders) {
    Write-Host "Analyse du dossier : $folder"

    Get-ChildItem -Path $folder -Recurse -File | Where-Object {
        $extensions -contains $_.Extension.ToLower()
    } | ForEach-Object {

        $target = Join-Path $destination $_.Name

        if ($DryRun) {
            Write-Host "[DRY-RUN] $($_.FullName) -> $target"
        } else {
            Copy-Item -Path $_.FullName -Destination $target -Force
            Write-Host "Copié : $($_.FullName)"
        }
    }
}

