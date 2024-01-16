Param(
    [string]$DisplayName,
    [string]$TenantId,
    [string]$ClientId,
    [string]$ClientSecret
)

$ClientId="a8ebd85b-dbf0-4cac-a4bf-eb3aa0bbe195"
$ClientSecret="uSl8Q~Nc7pdu87ic6BxP~ehjntN4Vkevb~sdNczK"
$TenantId="df49ebf2-2fd2-44c2-80f8-37058cc147b9"

# Convert the client secret to a secure string
$SecureClientSecret = ConvertTo-SecureString $ClientSecret -AsPlainText -Force

# Create a PSCredential object
$Credential = New-Object System.Management.Automation.PSCredential($ClientId, $SecureClientSecret)

# Connect to Azure with the service principal
Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant $TenantId

# Create Azure AD Application
$app = New-AzADApplication -DisplayName $DisplayName

$app.appid