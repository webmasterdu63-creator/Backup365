Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- Couleurs & style ---
$bgColor      = [System.Drawing.Color]::FromArgb(15, 20, 25)      # fond sombre
$panelColor   = [System.Drawing.Color]::FromArgb(25, 35, 45)      # panneaux
$accentColor  = [System.Drawing.Color]::FromArgb(0, 255, 140)     # vert néon
$textColor    = [System.Drawing.Color]::FromArgb(200, 255, 220)   # texte clair
$dangerColor  = [System.Drawing.Color]::FromArgb(255, 80, 80)     # rouge
$fontMono     = New-Object System.Drawing.Font("Consolas", 9)

# --- Fenêtre principale ---
$form = New-Object System.Windows.Forms.Form
$form.Text = "Backup365 :: CircuitBoard Edition"
$form.Size = New-Object System.Drawing.Size(720, 520)
$form.StartPosition = "CenterScreen"
$form.BackColor = $bgColor
$form.Font = $fontMono

# --- Titre ---
$title = New-Object System.Windows.Forms.Label
$title.Text = "Backup365 - Windows GUI"
$title.ForeColor = $accentColor
$title.Font = New-Object System.Drawing.Font("Consolas", 14, [System.Drawing.FontStyle]::Bold)
$title.AutoSize = $true
$title.Location = "20,15"
$form.Controls.Add($title)

# --- Ligne décorative ---
$line = New-Object System.Windows.Forms.Panel
$line.BackColor = $accentColor
$line.Size = "660,2"
$line.Location = "20,45"
$form.Controls.Add($line)

# --- Panel config ---
$panelConfig = New-Object System.Windows.Forms.Panel
$panelConfig.BackColor = $panelColor
$panelConfig.Size = "660,130"
$panelConfig.Location = "20,60"
$form.Controls.Add($panelConfig)

# Label Source
$labelSource = New-Object System.Windows.Forms.Label
$labelSource.Text = "SOURCE :"
$labelSource.ForeColor = $accentColor
$labelSource.Location = "10,15"
$labelSource.AutoSize = $true
$panelConfig.Controls.Add($labelSource)

# Champ Source
$textSource = New-Object System.Windows.Forms.TextBox
$textSource.Size = "430,20"
$textSource.Location = "100,12"
$textSource.BackColor = $bgColor
$textSource.ForeColor = $textColor
$textSource.BorderStyle = "FixedSingle"
$panelConfig.Controls.Add($textSource)

# Bouton Source
$btnSource = New-Object System.Windows.Forms.Button
$btnSource.Text = "BROWSE"
$btnSource.Size = "90,22"
$btnSource.Location = "540,10"
$btnSource.BackColor = $bgColor
$btnSource.ForeColor = $accentColor
$btnSource.FlatStyle = "Flat"
$btnSource.Add_Click({
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    if ($dialog.ShowDialog() -eq "OK") {
        $textSource.Text = $dialog.SelectedPath
    }
})
$panelConfig.Controls.Add($btnSource)

# Label Dest
$labelDest = New-Object System.Windows.Forms.Label
$labelDest.Text = "DEST   :"
$labelDest.ForeColor = $accentColor
$labelDest.Location = "10,50"
$labelDest.AutoSize = $true
$panelConfig.Controls.Add($labelDest)

# Champ Dest
$textDest = New-Object System.Windows.Forms.TextBox
$textDest.Size = "430,20"
$textDest.Location = "100,47"
$textDest.BackColor = $bgColor
$textDest.ForeColor = $textColor
$textDest.BorderStyle = "FixedSingle"
$panelConfig.Controls.Add($textDest)

# Bouton Dest
$btnDest = New-Object System.Windows.Forms.Button
$btnDest.Text = "BROWSE"
$btnDest.Size = "90,22"
$btnDest.Location = "540,45"
$btnDest.BackColor = $bgColor
$btnDest.ForeColor = $accentColor
$btnDest.FlatStyle = "Flat"
$btnDest.Add_Click({
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    if ($dialog.ShowDialog() -eq "OK") {
        $textDest.Text = $dialog.SelectedPath
    }
})
$panelConfig.Controls.Add($btnDest)

# Checkbox Dry-run
$chkDry = New-Object System.Windows.Forms.CheckBox
$chkDry.Text = "DRY-RUN MODE (NO WRITE)"
$chkDry.ForeColor = $accentColor
$chkDry.Location = "10,85"
$chkDry.AutoSize = $true
$panelConfig.Controls.Add($chkDry)

# --- Zone de logs ---
$labelLogs = New-Object System.Windows.Forms.Label
$labelLogs.Text = "LOG CONSOLE"
$labelLogs.ForeColor = $accentColor
$labelLogs.Location = "20,200"
$labelLogs.AutoSize = $true
$form.Controls.Add($labelLogs)

$logs = New-Object System.Windows.Forms.TextBox
$logs.Multiline = $true
$logs.ScrollBars = "Vertical"
$logs.Size = "660,220"
$logs.Location = "20,220"
$logs.BackColor = [System.Drawing.Color]::FromArgb(5, 10, 15)
$logs.ForeColor = $accentColor
$logs.BorderStyle = "FixedSingle"
$form.Controls.Add($logs)
# --- Logo ASCII ---
$logo = @"
██████╗  █████╗  ██████╗ ██╗   ██╗██╗  ██╗██████╗  ██████╗ 
██╔══██╗██╔══██╗██╔════╝ ██║   ██║██║ ██╔╝██╔══██╗██╔════╝ 
██████╔╝███████║██║  ███╗██║   ██║█████╔╝ ██████╔╝██║  ███╗
██╔══██╗██╔══██║██║   ██║██║   ██║██╔═██╗ ██╔══██╗██║   ██║
██║  ██║██║  ██║╚██████╔╝╚██████╔╝██║  ██╗██║  ██║╚██████╔╝
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ 

        Backup365 :: CircuitBoard GUI
             TSSR Edition 2026
"@

$logs.AppendText($logo + "`r`n")
# --- Son de démarrage ---
Add-Type -AssemblyName System.Media
$player = New-Object System.Media.SoundPlayer
$player.SoundLocation = "$PSScriptRoot\windows\dragon.mp3"
$player.Play()

# --- Bouton Run ---
$btnRun = New-Object System.Windows.Forms.Button
$btnRun.Text = "EXECUTE BACKUP"
$btnRun.Size = "200,35"
$btnRun.Location = "250,450"
$btnRun.BackColor = $bgColor
$btnRun.ForeColor = $accentColor
$btnRun.FlatStyle = "Flat"
$btnRun.Add_Click({

    if ([string]::IsNullOrWhiteSpace($textSource.Text) -or [string]::IsNullOrWhiteSpace($textDest.Text)) {
        $logs.AppendText("[ERROR] Source or destination is empty.`r`n")
        return
    }

    $logs.AppendText("[INFO] Generating .env...`r`n")

    $envContent = @"
BACKUP_SOURCE="$($textSource.Text)"
BACKUP_DEST="$($textDest.Text)"
LOG_LEVEL="INFO"
DRY_RUN="$($chkDry.Checked.ToString().ToLower())"
"@

    Set-Content -Path ".env" -Value $envContent -Encoding UTF8

    $logs.AppendText("[INFO] .env written.`r`n")
    $logs.AppendText("[INFO] Starting Backup365.ps1...`r`n`r`n")

    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "powershell.exe"
    $psi.Arguments = "-ExecutionPolicy Bypass -File `"windows/Backup365.ps1`""
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError  = $true
    $psi.UseShellExecute = $false
    $psi.CreateNoWindow = $true

    $proc = New-Object System.Diagnostics.Process
    $proc.StartInfo = $psi
    $proc.Start() | Out-Null

    $out = $proc.StandardOutput.ReadToEnd()
    $err = $proc.StandardError.ReadToEnd()
    $proc.WaitForExit()

    if ($out) { $logs.AppendText($out + "`r`n") }
    if ($err) { $logs.AppendText("[ERROR] " + $err + "`r`n") }
})
$form.Controls.Add($btnRun)

# --- Lancer ---
[System.Windows.Forms.Application]::EnableVisualStyles()
$form.ShowDialog()
