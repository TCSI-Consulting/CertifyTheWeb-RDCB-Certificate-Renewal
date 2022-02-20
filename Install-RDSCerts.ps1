$result = Get-Content -Raw -Path "C:\ProgramData\certify\assets\result.json" | ConvertFrom-Json

# use the result object values
$pfxpath = $result.ManagedItem.CertificatePath

Import-Module RemoteDesktop
# $Password = ConvertTo-SecureString -String “Ab123456” -AsPlainText -Force  -Password $Password
Set-RDCertificate -Role RDRedirector -ImportPath $pfxpath  -ConnectionBroker “pl-server1.corp.pennerlaw.net” -Force
start-sleep -s 30
Set-RDCertificate -Role RDPublishing -ImportPath $pfxpath -ConnectionBroker “pl-server1.corp.pennerlaw.net” -Force
start-sleep -s 30
Set-RDCertificate -Role RDWebAccess -ImportPath $pfxpath -ConnectionBroker “pl-server1.corp.pennerlaw.net” -Force
start-sleep -s 30
Set-RDCertificate -Role RDGateway -ImportPath $pfxpath -ConnectionBroker “pl-server1.corp.pennerlaw.net” -Force
start-sleep -s 30
