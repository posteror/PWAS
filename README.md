# Setup
1. Extract files from [Releases](https://github.com/vologin/pwacc/releases/tag/v1.0) into `C:\Program Files`
2. Open PowerShell Profile:
```ps1
notepad $PROFILE
```
3. Add this line:
```ps1
Set-Alias -Name pwacc -Value "C:\Program Files\pwacc\pwacc\pwacc.ps1"
```
4. Go to `C:\Program Files\pwacc\pwacc\accounts`, add your accounts using next template and save it as `.txt` file:
```txt
CognitoIdentityFileName=BinaryValue (67 2b 78 65 30 50 4c 38 57...)
lastLoginKeyFileName=BinaryValue (67 2b 78 65 30 50 4c 38 57...)
```
5. Type `pwacc fileName` inside of PowerShell, output should look like that:
```ps1
> pwacc MyCoolFileName
Processing file: C:\Program Files\pwacc\pwacc\accounts\MyCoolFileName.txt
Registry value updated for CognitoIdentity:IdentityId:us-east-1:b9d5be2b-8fae-4bc6-8a4b-e35fab411d76_h774736173
Registry value updated for lastLoginKey_h2295063355
Processing complete for C:\Program Files\pwacc\pwacc\accounts\MyCoolFileName.txt
Registry update completed for MyCoolFileName.txt in C:\Program Files\pwacc\pwacc\accounts
```
