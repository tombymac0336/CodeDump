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