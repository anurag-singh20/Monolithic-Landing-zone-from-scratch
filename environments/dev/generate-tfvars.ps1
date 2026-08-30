# CSV file
$csvFile = ".\resource_group.csv"

# Output terraform.tfvars
$outputFile = ".\terraform.tfvars"

# Read CSV
$rgs = Import-Csv $csvFile

# Create output
$output = @()

$output += "rgs = {"

foreach ($rg in $rgs) {

    $output += "  $($rg.key) = {"
    $output += "    name     = `"$($rg.name)`""
    $output += "    location = `"$($rg.location)`""
    $output += "  }"
    $output += ""
}

$output += "}"

# Generate terraform.tfvars
$output | Set-Content -Path $outputFile

Write-Host "terraform.tfvars generated successfully!"