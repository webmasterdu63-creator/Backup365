# Backup365 - Windows Backup Script
# --------------------------------
# Loads configuration from .env, performs backup, supports dry-run and logging.

# Load .env file
$envFile = ".env"
if (Test-Path $envFile) {
    Get-Content $envFile | ForEach-Object {
        if ($_ -match "^\s*#") { return }   # ignore comments
        if ($_ -match "^\s*$") { return }   # ignore empty lines
        $parts = $_ -split "=", 2
        if ($parts.Count -eq 2) {
            $name = $parts[0].Trim()
            $value = $parts[1].Trim('" ')
            Set-Item -Path "Env:$name" -Value $value
        }
    }
} else {
    Write-Host "[ERROR] .env file not found."
    exit 1
}

# Read variables
$source = $env:BACKUP_SOURCE
$dest   = $env:BACKUP_DEST
$logLvl = $env:LOG_LEVEL
$dryRun = $env:DRY_RUN -eq "true"

# Logging function
function Log {
    param([string]$msg, [string]$level = "INFO")

    if ($logLvl -eq "INFO" -or $level -eq "ERROR") {
        $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        Write-Host "[$timestamp] [$level] $msg"
    }
}

# Start
Log "Starting Backup365 (Windows)" "INFO"
Log "Source: $source" "INFO"
Log "Destination: $dest" "INFO"
Log "Dry-run: $dryRun" "INFO"

# Check paths
if (!(Test-Path $source)) {
    Log "Source path does not exist: $source" "ERROR"
    exit 1
}

if (!(Test-Path $dest)) {
    Log "Destination does not exist. Creating it..." "INFO"
    if (-not $dryRun) {
        New-Item -ItemType Directory -Path $dest -Force | Out-Null
    }
}

# Perform backup
Log "Copying files..." "INFO"

$copyParams = @{
    Path        = $source
    Destination = $dest
    Recurse     = $true
    Force       = $true
}

if ($dryRun) {
    Log "[DRY-RUN] Files that would be copied:" "INFO"
    Get-ChildItem -Recurse $source
} else {
    Copy-Item @copyParams
    Log "Backup completed successfully." "INFO"
}
