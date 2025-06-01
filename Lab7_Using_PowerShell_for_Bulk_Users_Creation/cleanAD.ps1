# Import the Active Directory module
Import-Module ActiveDirectory

# Define the root DN of your domain
$domainDN = "DC=vlabs25,DC=com"

# List of OUs to exclude from deletion (critical system OUs)
$excludedOUs = @("Domain Controllers", "Users", "Computers", "Builtin", "System", "ForeignSecurityPrincipals", "Managed Service Accounts")

# Get all OUs under the domain
$OUs = Get-ADOrganizationalUnit -Filter * -SearchBase $domainDN -SearchScope Subtree

foreach ($ou in $OUs) {
    $ouName = $ou.Name

    if ($excludedOUs -contains $ouName) {
        Write-Host "Skipping protected OU: $ouName" -ForegroundColor Gray
        continue
    }

    Write-Host "Processing OU: $ouName" -ForegroundColor Cyan

    # Delete users in the OU
    Get-ADUser -Filter * -SearchBase $ou.DistinguishedName -SearchScope Subtree | ForEach-Object {
        Write-Host "Deleting user: $($_.SamAccountName)" -ForegroundColor Yellow
        Remove-ADUser -Identity $_ -Confirm:$false
    }

    # Delete groups in the OU
    Get-ADGroup -Filter * -SearchBase $ou.DistinguishedName -SearchScope Subtree | ForEach-Object {
        Write-Host "Deleting group: $($_.Name)" -ForegroundColor Yellow
        Remove-ADGroup -Identity $_ -Confirm:$false
    }

    # Remove protection from accidental deletion before removing the OU
    Set-ADOrganizationalUnit -Identity $ou.DistinguishedName -ProtectedFromAccidentalDeletion $false

    # Delete the OU itself
    Write-Host "Deleting OU: $ouName" -ForegroundColor Red
    Remove-ADOrganizationalUnit -Identity $ou.DistinguishedName -Recursive -Confirm:$false
}

Write-Host "All non-protected OUs, users, and groups under $domainDN have been deleted." -ForegroundColor Green