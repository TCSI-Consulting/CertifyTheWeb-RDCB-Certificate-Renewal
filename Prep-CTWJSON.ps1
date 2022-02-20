param($result)

$result | ConvertTo-Json -depth 100 | Out-File "C:\ProgramData\certify\assets\result.json"