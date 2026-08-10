Admin Approval Mode is a Windows User Account Control setting that can elevate privileges when an approval prompt appears :

<img width="311" height="229" alt="image_paste851311" src="https://github.com/user-attachments/assets/2b5a2f49-425d-49c8-87e8-ecd449f50e03" />

You need to EnableLUA via GPO :

<img width="1676" height="527" alt="image_paste3223028" src="https://github.com/user-attachments/assets/1a552b44-d2c8-4c3d-a5e9-563ed0b45000" />

Or registry setting :
```pwsh
New-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -n EnableLUA -v 1 -pr Dword
```
To check if it's enabled :

```pwsh
gpv HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -n EnableLUA
```
See [UAC Run all administrators in Admin Approval Mode - Windows 10 | Microsoft Learn](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/security-policy-settings/user-account-control-run-all-administrators-in-admin-approval-mode#best-practices)
