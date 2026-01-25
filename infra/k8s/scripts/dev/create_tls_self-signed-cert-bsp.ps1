$cert = New-SelfSignedCertificate `
  -DnsName "licensetool.local" `
  -CertStoreLocation "<Certlocation>" `
  -NotAfter (Get-Date).AddDays(365)

$password = ConvertTo-SecureString -String "<Password>" -Force -AsPlainText

Export-PfxCertificate `
  -Cert $cert `
  -FilePath .\licensetool.local.pfx `
  -Password $password

Export-Certificate `
  -Cert $cert `
  -FilePath .\licensetool.local.crt

