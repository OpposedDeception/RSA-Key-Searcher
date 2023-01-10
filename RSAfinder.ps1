# Define the path to the file that you want to search
$filePath = "C:\path\to\your\file.txt"

# Define the output file path
$outputFile = "C:\path\to\output\file.txt"

# Search for RSA private key
$privateKey = Select-String -Path $filePath -Pattern "-----BEGIN RSA PRIVATE KEY-----"

# Search for RSA public key
$publicKey = Select-String -Path $filePath -Pattern "-----BEGIN PUBLIC KEY-----"

# Search for certificates
$certificate = Select-String -Path $filePath -Pattern "-----BEGIN CERTIFICATE-----"

# Write the results to the output file
$privateKey,$publicKey,$certificate | Out-File -FilePath $outputFile
