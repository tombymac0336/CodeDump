

ping localhost -n 3 >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
REM  ver. 1.1
REM  thommy mcneil

REM  ************************************************************************************** 
echo This script identifies and removes Veritas NetBackup 6.5.x >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
REM  **************************************************************************************

echo %COMPUTERNAME% running %PROCESSOR_ARCHITECTURE% CPU >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1

REM  ******************************************************************
echo Stopping NetBackup Services >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
REM  *******************************************************************

NET STOP "NetBackup INET Daemon" >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
NET STOP "NetBackup SAN Client Fiber Transport Service" >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
NET STOP  VRTSpbx >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1 
ping localhost -n 5


SET DIRVERITAS="C:\Program Files\Veritas"
SET DIRVERITAS64="C:\Program Files (x86)\Veritas"
SET NETTEMP="C:\NetBackup Temp"
SET UPSMENU="C:\Documents and Settings\All Users\Start Menu\Programs" 
IF EXIST %DIRVERITAS% echo The Veritas NetBackup  Program folder exists and will be removed >>%SYSTEMROOT%\NetBackupRemoval.log 2>&1
IF EXIST %DIRVERITAS64% echo The Veritas Netbackup 64 bit Program folder exists and will be removed >>NetBackupRemoval.log 2>&1

REM  ******************************************************************************
Echo Removing Veritas Netbackup file system folders >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
REM  ******************************************************************************
CD \
C:
Attrib -h "NetBackup Temp"
Attrib -r "NetBackup Temp"
RMDIR "NetBackup Temp" /S /Q
CD "Program Files"
CD Veritas 
RMDIR NetBackup /S /Q
RMDIR Backup /S /Q
RMDIR Help /S /Q
RMDIR Patch /S /Q
RMDIR msg /S /Q

CD \
C:
CD "Program Files (x86)"
CD Veritas
RMDIR NetBackup /S /Q
RMDIR Backup /S /Q
RMDIR Help /S /Q
RMDIR Patch /S /Q
RMDIR msg /S /Q


REM  ********************************************************************************
Echo Removing Veritas NetBackup from All Users Start Menu >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1 
REM  *********************************************************************************
C:
CD \
CD %UPSMENU% 
RMDIR "Veritas NetBackup" /S /Q

CD C:\
CD %SYSTEMROOT%\System32

REM  ************************************************************************************
echo Removing NetBackup  Services from server >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
REM  ************************************************************************************

C:
CD \
CD %SYSTEMROOT%\System32
SC.exe delete "NetBackup INET Daemon" >> %SYSTEMROOT%\UpstreamRemoval.log 2>&1
SC.exe delete "NetBackup SAN Client Fibre Transport Service" >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1

REM  ********************************************************************************
Echo Removing FDR Veritas NetBackup registry entries from HKLM\SOFTWARE >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1 
REM  *********************************************************************************

reg delete "HKLM\SOFTWARE\Veritas\NetBackup" /F 
reg delete "HKLM\SOFTWARE\Veritas\Netbackup for Microsoft SQL Server" /F

REM  ********************************************************************************
Echo Removing x64 FDR Upstream registry entries from HKLM\SOFTWARE\Wow6432Node >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
REM  *********************************************************************************


reg delete "HKLM\SOFTWARE\Wow6432Node\Veritas\NetBackup" /F 
reg delete "HKLM\SOFTWARE\Wow6432Node\Veritas\NetBackup for SQL Server" /F
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Management\ARPCache\Veritas NetBackup Client" /F



REM  *********************************************************************************
echo Uninstall Registry key removal for machines running x86 version of Windows Server 200x  >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
REM  *********************************************************************************

FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Veritas NetBackup Client"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue



FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Veritas NetBackup"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue


FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Veritas NetBackup*"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue


REM  *********************************************************************************
Echo  Uninstall Registry key removal for machines running x64 version of Windows Server 200x >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
REM  *********************************************************************************

FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Veritas NetBackup Client"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue


FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Veritas NetBackup"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue



FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKCR\Wow6432Node\Installer\Products" /s /f "Veritas NetBackup Client"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue


FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKCR\Wow6432Node\Installer\Products" /s /f "Veritas NetBackup"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue



FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\SOFTWARE\Classes\Wow6432Node\Installer\Products" /s /f "Veritas NetBackup"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue


FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\SOFTWARE\Classes\Wow6432Node\Installer\Products" /s /f "Veritas NetBackup Client"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue 

REM  ***********************************************


FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\SOFTWARE\Classes\Installer\Products" /s /f "Veritas NetBackup Client"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue 


FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\SOFTWARE\Classes\Installer\Products" /s /f "Veritas NetBackup 6.5.4 (6.5 Release Update 4"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue 



FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\SOFTWARE\Classes\Installer\Products" /s /f "Veritas NetBackup*"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue 


REM  **********************************************************************************
ECHO  Removal Completed >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1
REM  **********************************************************************************
echo  Veritas NetBackup Client 6.5.x removed %DATE% at %TIME% on system %COMPUTERNAME% with %PROCESSOR_ARCHITECTURE% proc >> %SYSTEMROOT%\NetBackupRemoval.log 2>&1


