# Import the Active Directory module
Import-Module ActiveDirectory

# Define the path to the CSV file
$csvPath = "C:\users.csv"

# Import users from the CSV file using ';' as the delimiter
$users = Import-Csv -Path $csvPath -Delimiter ';'

# Define the base Distinguished Name (DN) for the domain
$domainDN = "DC=vlabs07,DC=com"

# Set the default password for all users and convert it to a secure string
$defaultPassword = ConvertTo-SecureString "Passw0rd$" -AsPlainText -Force

# Loop through each user record in the CSV file
foreach ($user in $users) {
    $firstName = $user.'FIRST NAME'
    $lastName = $user.'LAST NAME'
    $department = $user.DEPARTEMENT
    $userName = "$firstName.$lastName"
    $displayName = "$firstName $lastName"
    $ouPath = "OU=$department,$domainDN"
    $userPrincipalName = "$userName@vlabs07.com"

    # Check if the Organizational Unit (OU) exists; create it if it does not
    if (-not (Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$ouPath'" -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $department -Path $domainDN
        Write-Host "Created OU: $department"
    }

    # Check if the user already exists; create the user if not
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$userName'" -ErrorAction SilentlyContinue)) {
        New-ADUser -GivenName $firstName -Surname $lastName -SamAccountName $userName `
            -UserPrincipalName $userPrincipalName -Name $displayName -Path $ouPath `
            -AccountPassword $defaultPassword -Enabled $true `
            -PasswordNeverExpires $false -ChangePasswordAtLogon $true
        Write-Host "Created user: $displayName"
    }

    # Check if the group (named after the department) exists; create it if not
    if (-not (Get-ADGroup -Filter "Name -eq '$department'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $department -GroupScope Global -Path $ouPath
        Write-Host "Created group: $department"
    }

    # Add the user to the department group
	Add-ADGroupMember -Identity $department -Members $userName
	Write-Host "Added $displayName to group: $department"
}
