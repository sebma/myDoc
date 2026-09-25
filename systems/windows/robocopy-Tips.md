# Filter robocopy output errors on stdout when using the "/tee" option
```pwsh
robocopy @robocopyOptions /tee $source $destination | Select-String "\b(ERROR|0x|Access is denied|failed)"
# OR with "findstr"
robocopy @robocopyOptions /tee $source $destination | findstr -i -r '\<ERROR \<0x \<denied \<failed'
```
