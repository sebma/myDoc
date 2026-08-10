Admin Approval Mode is a Windows User Account Control setting that can elevate privileges when an approval prompt appears.

```pwsh
New-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -n EnableLUA -pr Dword
```
To check if it's enabled :

```pwsh
gpv HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -n EnableLUA
```
