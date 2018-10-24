
REM  *******************
REM  REMOVE ver 25.12.2
REM  *******************
COPY %~dp0xagtSetup_25.12.2_universal.msi C:\Windows\Installer /Y
COPY %~dp0agent_config.json C:\Windows\Installer /Y


REG DELETE HKEY_CLASSES_ROOT\Installer\Products\E252D19BC7754C44BA919EA8DB237022 /f
REG DELETE HKEY_CLASSES_ROOT\Installer\Products\20FE1E5586AD3D646895A69228F2561C /f
REG DELETE HKEY_CLASSES_ROOT\Installer\Products\5D00828D8A72CAF45946F3071075ABF2 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{FEA45807-8990-47DC-A1F0-020749B7C0DF}" /v "InstallSource" /d "C:\Windows\Installer" /t REG_SZ /f 
REG ADD "HKEY_CLASSES_ROOT\Installer\Products\70854AEF0998CD741A0F2070947B0CFD\Sourcelist" /v "LastUsedSource" /d "n;1;C:\Windows\Installer" /t REG_EXPAND_SZ /f
REG ADD "HKEY_CLASSES_ROOT\Installer\Products\70854AEF0998CD741A0F2070947B0CFD\SourceList\Net" /v "1" /d "C:\Windows\Installer" /t REG_EXPAND_SZ /f 

Ping 127.0.0.1 -n 5 > NUL
MsiExec.exe /X{FEA45807-8990-47DC-A1F0-020749B7C0DF} /passive /norestart
@echo %COMPUTERNAME% -- %PROCESSOR_ARCHITECTURE% cpu -- %DATE% -- %TIME% >> C:\Windows\Temp\FireEye25122.log 2>&1
@echo  Removed FireEye 25.12.2 >> C:\Windows\Temp\FireEye25122.log 2>&1



Ping 127.0.0.1 -n 5 > NUL
REM   **********************
REM   INSTALL ver 26.21.10
REM   **********************
COPY %~dp0xagtSetup_26.21.10_universal.msi C:\Windows\Installer /Y
COPY %~dp0agent_config.json C:\Windows\Installer /Y  

%WINDIR%\system32\msiexec.exe /i C:\Windows\Installer\xagtSetup_26.21.10_universal.msi /l*v "C:\Windows\Temp\FireEye262110.log" /passive /norestart  


REM   *******************************************************
REM   HKEY_CLASSES_ROOT\Installer\Products\E252D19BC7754C44BA919EA8DB237022   is FireEye 20.40.0
REM   HKEY_CLASSES_ROOT\Installer\Products\20FE1E5586AD3D646895A69228F2561C   is FireEye 21.33.7
REM   HKEY_CLASSES_ROOT\Installer\Products\5D00828D8A72CAF45946F3071075ABF2   is FireEye 25.12.0
REM   HKEY_CLASSES_ROOT\Installer\Products\70854AEF0998CD741A0F2070947B0CFD   is FirEye 25.12.2
REM   HKEY_CLASSES_ROOT\Installer\Products\3449300B346CCF44B95048F4956D9600   is FireEye 26.12.10