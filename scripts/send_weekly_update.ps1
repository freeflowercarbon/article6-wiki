# Article 6.2 Wiki — Weekly Update Email Sender
# Reads from outputs/weekly_update.txt and sends to shimonhama@gmail.com via Gmail SMTP
# Requires: $env:GMAIL_APP_PASSWORD to be set (Gmail App Password for shimonhama@gmail.com)

param(
    [string]$UpdateFile = "C:\Users\freef\OneDrive\デスクトップ\claude\article6-wiki\outputs\weekly_update.txt"
)

$To = "shimonhama@gmail.com"
$From = "shimonhama@gmail.com"
$Subject = "Article 6.2 Wiki — Weekly Update $(Get-Date -Format 'yyyy-MM-dd')"

if (-not (Test-Path $UpdateFile)) {
    Write-Error "Update file not found: $UpdateFile"
    exit 1
}

$Body = Get-Content $UpdateFile -Raw -Encoding UTF8

$AppPassword = $env:GMAIL_APP_PASSWORD
if (-not $AppPassword) {
    Write-Error "GMAIL_APP_PASSWORD environment variable not set"
    exit 1
}

$SecurePassword = ConvertTo-SecureString $AppPassword -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential($From, $SecurePassword)

$SmtpParams = @{
    SmtpServer = "smtp.gmail.com"
    Port = 587
    UseSsl = $true
    Credential = $Credential
    From = $From
    To = $To
    Subject = $Subject
    Body = $Body
    Encoding = [System.Text.Encoding]::UTF8
}

try {
    Send-MailMessage @SmtpParams
    Write-Host "Email sent successfully to $To"
} catch {
    Write-Error "Failed to send email: $_"
    exit 1
}
