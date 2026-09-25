# Filter robocopy output errors on stdout when using the "/tee" option
```pwsh
robocopy @robocopyOptions /tee $source $destination | Select-String "\b(ERROR|0x|Access is denied|failed)"
```
