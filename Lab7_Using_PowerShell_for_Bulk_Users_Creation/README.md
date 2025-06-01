# 🧪 Lab 7 – Using PowerShell for Bulk Users Creation

This lab automates the creation of Active Directory user accounts using a PowerShell script and data from a CSV file. It demonstrates best practices for managing OUs, user attributes, and group membership via script logic. It is part of a larger lab series completed as part of the **Network Administration AEC** program at **John Abbott College**.
---

## 🧭 Lab Objectives

- Read user data from a `users.csv` file
- Use a PowerShell script to:
  - Create OUs for each department
  - Generate usernames using naming conventions
  - Create AD users and assign attributes
  - Place users in the correct OUs
  - Create and assign users to department-based security groups
- Validate results using both PowerShell and ADUC

---

## 🔧 Skills Practiced

- PowerShell scripting with `Import-CSV`, `New-ADUser`, `New-ADOrganizationalUnit`, `New-ADGroup`, etc.
- String parsing and logic for username creation
- Bulk automation of user provisioning
- AD structure planning: OU design and group management
- Validation using `Get-ADUser`, `Get-ADGroupMember`, `Get-ADOrganizationalUnit`

---

## 📄 Files

- 📘 [**Lab Instructions** – Assignment PDF](./Lab7_Using_PowerShell_for_Bulk_Users_Creation/Lab_7_Instructions_Using_PowerShell_for_bulk_users_creation.pdf)
- 📝 [**Final Lab Report** – Completed Work](./Lab7_Using_PowerShell_for_Bulk_Users_Creation/Lab7_Guillermo_Padilla_Keymole_Using_PowerShell_for_bulk_users_creation.pdf)
- 💻 [**addusers.ps1** – PowerShell Script](./Lab7_Using_PowerShell_for_Bulk_Users_Creation/addusers.ps1)
- 🧹 [**cleanAD.ps1** – Optional Cleanup Script](./Lab7_Using_PowerShell_for_Bulk_Users_Creation/cleanAD.ps1)
- 📂 [**users.csv** – User Input File](./Lab7_Using_PowerShell_for_Bulk_Users_Creation/users.csv)

---

## 👨‍💻 Author

**Guillermo Padilla Keymole**  
AEC – Network and System Administration  
John Abbott College
