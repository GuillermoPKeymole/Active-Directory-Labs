# 🧪 Lab 7 – Using PowerShell for Bulk Users Creation

This lab automates the creation of user accounts in Active Directory using PowerShell and CSV input. It includes OU creation, user attribute assignment, group membership, and clean-up scripting. Completed as part of the **Network Administration AEC** program at **John Abbott College**.

---

## 🧭 Lab Objectives

- Read input from `users.csv` to create users and departments
- Create OUs for each department listed in the CSV
- Automatically generate usernames and assign attributes
- Create and assign users to departmental groups
- Validate creation and cleanup using PowerShell

---

## 🔧 Skills Practiced

- Scripting with `Import-CSV`, `New-ADUser`, `New-ADOrganizationalUnit`, and `New-ADGroup`
- Using loops, variables, and conditions in PowerShell
- Bulk creation and cleanup of AD objects
- Organizational planning for departments and permissions
- Output validation using `Get-ADUser`, `Get-ADGroupMember`, and ADUC

---

## 📄 Files

- 📘 [**Lab Instructions** – Assignment PDF](./Lab%207%20-%20Using%20PowerShell%20for%20bulk%20users%20creation.pdf)
- 📝 [**Final Lab Report** – Completed Work](./Lab7_Guillermo_Padilla_Keymole_Using_PowerShell_for_bulk_users_creation.pdf)
- 💻 [**addusers.ps1** – PowerShell Script](./addusers.ps1)
- 🧹 [**cleanAD.ps1** – Cleanup Script](./cleanAD.ps1)
- 📂 [**users.csv** – Bulk User Data](./users.csv)

---

## 👨‍💻 Author

**Guillermo Padilla Keymole**  
AEC – Network and System Administration  
John Abbott College
