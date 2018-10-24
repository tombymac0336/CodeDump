

ping localhost -n 3 >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
REM  ver. 1.0
REM  thommy mcneil

REM  ************************************************************************************** 
echo This script identifies and removes EMC Networker 7.3.x - 7.5.x >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
REM  **************************************************************************************

echo %COMPUTERNAME% running %PROCESSOR_ARCHITECTURE% CPU >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1

REM  ******************************************************************
echo Stopping EMC Networker Power Monitor and Networker Remote Exec Services >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
REM  *******************************************************************

NET STOP nsrexecd >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
NET STOP nsrpm >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
ping localhost -n 5


SET DIRNETWORKER="C:\Program Files\Legato"
SET UPSMENU="C:\Documents and Settings\All Users\Start Menu\Programs" 
IF EXIST %DIRNETWORKER% echo The EMC Networker Program folder exists and will be removed >>%SYSTEMROOT%\EMCNetworker_Remove.log 2>&1


REM  ******************************************************************************
Echo Removing EMC Networker file system folders >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
REM  ******************************************************************************
CD \
C:
CD "Program Files" 
RMDIR Legato /S /Q




REM  ********************************************************************************
Echo Removing EMC Networker from All Users Start Menu >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1 
REM  *********************************************************************************
C:
CD \
CD %UPSMENU% 
RMDIR "EMC Networker" /S /Q
CD \


REM  ************************************************************************************
echo Removing EMC Networker  Services from server >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
REM  ************************************************************************************

C:
CD \
CD %SYSTEMROOT%\System32
SC.exe delete nsrexecd >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
SC.exe delete nsrpm >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1

REM  ********************************************************************************
Echo Removing EMC Networker registry entries from HKLM\SOFTWARE >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1 
REM  *********************************************************************************

reg delete "HKLM\SOFTWARE\Legato\Networker" /F 
reg delete "HKLM\SOFTWARE\Legato\Networker Configuration Wizard" /F

REM  ********************************************************************************
Echo Removing x64 EMC Networker registry entries from HKLM\SOFTWARE\Wow6432Node >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1 
REM  *********************************************************************************


reg delete "HKLM\SOFTWARE\Wow6432Node\Legato\Networker" /F 
reg delete "HKLM\SOFTWARE\Wow6432Node\Legato\Networker Configuration Wizard" /F



REM  *********************************************************************************
echo Uninstall Registry key removal for machines running x86 version of Windows Server 200x  >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
REM  *********************************************************************************

FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Networker"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue



FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "EMC Networker"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue


FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "EMC_Networker"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue







REM  *********************************************************************************
Echo  Uninstall Registry key removal for machines running x64 version of Windows Server 200x >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
REM  *********************************************************************************

FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "Networker"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue


FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "EMC Networker"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue


FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "EMC_Networker"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue






REM  *********************************************************************************
Echo  Installed products Reg key removal for machines running x86 version of Windows Server 200x >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
REM  *********************************************************************************




FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\SOFTWARE\Classes\Installer\Products" /s /f "Networker"') DO (
                reg delete "%%a" 
                GOTO Continue
)
:Continue



FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\SOFTWARE\Classes\Installer\Products" /s /f "EMC Networker"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue


FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKLM\SOFTWARE\Classes\Installer\Products" /s /f "EMC_Networker"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue


REM  *********************************************************************************
Echo  Installed products Reg key removal for machines running x64 version of Windows Server 200x >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1
REM  *********************************************************************************



FOR /F "skip=1 tokens=*" %%a in ('reg.exe query "HKCR\Wow6432Node\Installer\Products" /s /f "Networker"') DO (
                reg delete "%%a" /f
                GOTO Continue
)
:Continue



REM  **********************************************************************************
ECHO  Removal Completed >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1 
REM  **********************************************************************************
echo  EMC Networker 7.x.x removed %DATE% at %TIME% on system %COMPUTERNAME% with %PROCESSOR_ARCHITECTURE% proc >> %SYSTEMROOT%\EMCNetworker_Remove.log 2>&1 


