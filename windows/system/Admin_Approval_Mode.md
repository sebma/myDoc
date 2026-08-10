Admin Approval Mode is a Windows User Account Control setting that can elevate privileges when an approval prompt appears.

```pwsh
New-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -n EnableLUA -v 1 -pr Dword
```
To check if it's enabled :

```pwsh
gpv HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -n EnableLUA
```
See [UAC Run all administrators in Admin Approval Mode - Windows 10 | Microsoft Learn](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/security-policy-settings/user-account-control-run-all-administrators-in-admin-approval-mode#best-practices)
