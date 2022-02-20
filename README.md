# CertifyTheWeb-RDCB-Certificate-Renewal
Scripts for allowing Certify The Web to auto renew and update certificates in Remote Desktop Gateway Connection Broker Server

Add the scripts to the Certify Deployment Tasks in the following order:

1 - Prep-CTWJSON.ps1 <cr>
2 - Install-RDSCerts.ps1

#1 - Prep-CTWJSON.ps1:

General Settings:
Task Name:      Prep JSON

Task Parameters:
Authentication: Local
Program/Script: Set the path to the script file here

#2 - Install-RDSCerts.ps1

This task is required to run as "administrator", so you have to create a "Local (as specific user)" credential in Certify to allow it to run the scrip as an administrator.
I will likely work on this in the future to allow it to run as a Service User account with only the required permissions for changing the certificate in RDS, but for now I've used an admin account on the server.

General Settings:
Task Name:      Update RDCB Certs

Task Parameters:
Authentication: Local (as specific user)
Program/Script: Set the path to the script file here
Impersonation LogonType:  New Credentials

This specific combination is required in order for the INSTALL script to run properly.

Lastly, unrelated to these scripts, also make sure to add the following Deployment Task "Built in" Certify Script:

Deploy to RDP Gateway Service

This last script is built into Certify and assigns the certificate into the Remote Desktop Gateway Manager.  As it's a prebuilt script from Certify it doesn't require any changes to its settings.  It can be run before or after #1 & #2 above.
