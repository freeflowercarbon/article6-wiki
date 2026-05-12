# Article 6.2 Wiki - Weekly Update Email Sender
# To: shimonhama@gmail.com
# Required environment variables:
#   SENDER_EMAIL    - sender email address
#   SENDER_PASSWORD - sender SMTP password (Gmail App Password)
#   SMTP_SERVER     - optional, default: smtp.gmail.com
#   SMTP_PORT       - optional, default: 587

param(
    [string]$UpdateFile = ""
)
if (-not $UpdateFile) {
    $UpdateFile = Join-Path $PSScriptRoot "..\outputs\weekly_update.txt"
}

$To = "shimonhama@gmail.com"
$From = $env:SENDER_EMAIL
$Password = $env:SENDER_PASSWORD
$SmtpServer = if ($env:SMTP_SERVER) { $env:SMTP_SERVER } else { "smtp.gmail.com" }
$SmtpPort = if ($env:SMTP_PORT) { [int]$env:SMTP_PORT } else { 587 }
$Subject = "Article 6.2 Wiki - Weekly Update " + (Get-Date -Format "yyyy-MM-dd")

if (-not $From) {
    Write-Error "Environment variable SENDER_EMAIL is not set"
    exit 1
}
if (-not $Password) {
    Write-Error "Environment variable SENDER_PASSWORD is not set"
    exit 1
}
if (-not (Test-Path $UpdateFile)) {
    Write-Error "Update file not found: $UpdateFile"
    exit 1
}

$Body = Get-Content $UpdateFile -Raw -Encoding UTF8

$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential($From, $SecurePassword)

$SmtpParams = @{
    SmtpServer = $SmtpServer
    Port       = $SmtpPort
    UseSsl     = $true
    Credential = $Credential
    From       = $From
    To         = $To
    Subject    = $Subject
    Body       = $Body
    Encoding   = [System.Text.Encoding]::UTF8
}

try {
    Send-MailMessage @SmtpParams
    Write-Host "Email sent successfully to $To"
} catch {
    Write-Error "Failed to send email: $_"
    exit 1
}
