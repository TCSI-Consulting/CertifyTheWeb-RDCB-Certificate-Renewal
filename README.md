# CertifyTheWeb-RDS-Certificate-Renewal
Scripts for allowing Certify The Web to auto renew and update certificates in Remote Desktop Gateway Server

Add the scripts to the Certify Deployment Tasks in the following order:

1 - Prep-CTWJSON.ps1
2 - Install-RDSCerts.ps1

#1 - Prep-CTWJSON.ps1:

General Settings:
Task Name:      Prep JSON

Task Parameters:
Authentication: Local
Program/Script: Set the path to the script file here

#2 - Install-RDSCerts.ps1

This task is required to run as "administrator", so you have to create a "Local (as specific user)" credential in Certify to allow it to run the scrip as an administrator.
I will likely work on this in the future to allow it to run as a Service User account with only the required permissions for changing the certificate in RDS, but for now
I've used an admin account on the server.

General Settings:
Task Name:      Update RDCB Certs

Task Parameters:
Authentication: Local (as specific user)
Program/Script: Set the path to the script file here
