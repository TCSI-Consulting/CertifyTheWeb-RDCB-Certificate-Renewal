$result = Get-Content -Raw -Path "C:\ProgramData\certify\assets\result.json" | ConvertFrom-Json

$server = get-rdserver | select server
$servername = $server.name

#Remote Desktop Gateway Service & Display Name for checking service status and starting if needed.
#The Service can take a long time to stop, and this is my work around to make sure it's running after each certificate update

$RDGServiceName = (get-service TSGateway).displayname
$RDGService = (get-service TSGateway)

# use the result object values
$pfxpath = $result.ManagedItem.CertificatePath

Import-Module RemoteDesktop

# If your PFX requires a password:
# $Password = ConvertTo-SecureString -String “Ab123456” -AsPlainText -Force  -Password $Password

Set-RDCertificate -Role RDRedirector -ImportPath $pfxpath  -ConnectionBroker $servername -Force
start-sleep -s 30
Write-Host "`r`nAnalyzing $RDGServiceName" -f Yellow
	if($RDGService.status -eq "Stopped"){
		"Starting $($RDGServiceName)"
	start-service $TSGatewayService}

Set-RDCertificate -Role RDPublishing -ImportPath $pfxpath -ConnectionBroker $servername -Force
start-sleep -s 30
Write-Host "`r`nAnalyzing $RDGServiceName" -f Yellow
	if($RDGService.status -eq "Stopped"){
		"Starting $($RDGServiceName)"
	start-service $TSGatewayService}

Set-RDCertificate -Role RDWebAccess -ImportPath $pfxpath -ConnectionBroker $servername -Force
start-sleep -s 30
Write-Host "`r`nAnalyzing $RDGServiceName" -f Yellow
	if($RDGService.status -eq "Stopped"){
		"Starting $($RDGServiceName)"
	start-service $TSGatewayService}

Set-RDCertificate -Role RDGateway -ImportPath $pfxpath -ConnectionBroker $servername -Force
start-sleep -s 30
Write-Host "`r`nAnalyzing $RDGServiceName" -f Yellow
	if($RDGService.status -eq "Stopped"){
		"Starting $($RDGServiceName)"
	start-service $TSGatewayService}
