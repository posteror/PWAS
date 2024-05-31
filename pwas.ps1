param (
    [string]$fileName
)

$registryPath = "HKCU:\Software\Kukouri\Pixel Worlds"
$accountsDirectory = ""

# Function to set registry binary value
function Set-RegistryBinary {
    param (
        [string]$key,
        [byte[]]$value
    )
    Set-ItemProperty -Path $registryPath -Name $key -Value $value -Type Binary
}

if (-not $fileName) {
    Write-Host "Usage: pwacc.ps1 filename"
    exit 1
}

# Check if the accounts directory exists
if (-not (Test-Path $accountsDirectory -PathType Container)) {
    Write-Host "Accounts directory not found: $accountsDirectory"
    exit 1
}

# Get the exact .account file matching the provided filename
$accountFile = Get-ChildItem -Path $accountsDirectory -Filter "$fileName.account" | Select-Object -First 1

# Check if the file exists
if (-not $accountFile) {
    Write-Host "No .account file found with the name '$fileName.account' in $accountsDirectory"
    exit 1
}

# Process the exact .accountFile file
Write-Host "Processing file: $($accountFile.FullName)"

# Open and process the contents of the file
Get-Content $accountFile.FullName | ForEach-Object {
    $line = $_

    # Split the line into key and value parts
    $key = $line.Split('=')[0]
    $value = $line.Split('=')[1]

    # Remove leading and trailing whitespaces from the value
    $value = $value.Trim()

    # Convert hexadecimal string to byte array
    $bytes = @()
    $value -split ' ' | ForEach-Object {
        $byte = [byte]::Parse($_, 'HexNumber')
        $bytes += $byte
    }
    $binaryValue = [byte[]]$bytes

    Set-RegistryBinary -key $key -value $binaryValue
    Write-Host "Registry value updated for $key"
}

Write-Host "Processing complete for $($accountFile.FullName)"
Write-Host "Registry update completed for $fileName.account in $accountsDirectory"
