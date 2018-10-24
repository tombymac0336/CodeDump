appwiz.cpl

PAUSE
IF NOT EXIST "C:\Program Files\Tripwire" GOTO NOAGENT
GOTO UPDATEAGENT


:UPDATEAGENT
NET STOP teagent
SET TRIPDIR="C:\Program Files\Tripwire\TE\Agent\data\config"
DEL %TRIPDIR%\agent.properties /Q
COPY \\msinstall\pkg_source\Client\Tripwire_837\agent.properties %TRIPDIR% /Y
@echo ************************
ping localhost -n 1 > NUL
@echo ************************
ipconfig | find "172."
COPY \\msinstall\patches\cmtrace.exe C:\Windows /Y

for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "IPv4"^|Find "172"') do set ip=%%b
set ip=%ip:~1%
echo %ip%

echo tw.rpc.interfaceAddr=%ip%>> "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"
echo java.rmi.server.hostname=%COMPUTERNAME%.lowes.com>> "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"
REM PAUSE
CALL notepad "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"
NET START teagent
CALL cmtrace.exe "C:\Program Files\Tripwire\TE\Agent\data\log\teagent.log"
EXIT

:NOAGENT
@ECHO  No Tripwire Agent currently installed to update...
@echo ***************************************************
@echo This script installs Tripwire Agent  8.3.7
@echo for Windows Servers ONLY
@echo x64 version or x86 version based on platform. 
@echo ***************************************************


@ECHO OFF

:FILECOPY
if "%PROCESSOR_ARCHITECTURE%"=="x86" goto fILECOPY32
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto FILECOPY64

:FILECOPY32
copy "\\msinstall\patches\Tripwire_837\te_agent.msi" %WINDIR%\installer /Y
copy "\\msinstall\patches\Tripwire_837\cmtrace.exe"  %WINDIR% /Y
@echo.
@echo *********************************
@echo Tripwire Agent (x86) 8.3.7 copied to C:\Windows\Installer directory
GOTO INSTALL32

:FILECOPY64
copy "\\msinstall\patches\Tripwire_837\te_agent64.msi" %WINDIR%\installer /Y
copy "\\msinstall\patches\Tripwire_837\cmtrace.exe"  %WINDIR% /Y
@echo.
@echo *********************************
@echo Tripwire Agent (x64) 8.3.7 copied to C:\Windows\Installer directory
GOTO INSTALL64


@echo *********************************


:INSTALL32
%WINDIR%\system32\msiexec.exe /i "C:\Windows\Installer\te_agent.msi" /passive /L*V "C:\Windows\TripwireInstall.log" TE_SERVER_HOSTNAME=lxvrdctrp1.lowes.com TE_SERVER_PORT=9898 SERVICES_PASSWORD=tripwire_rdc START_AGENT=true INSTALL_RTM=false ACCEPT_EULA=true
@echo.
@echo **********************************
@echo Loaded 32 BIT install for Tripwire 8.3.7
@echo Now updating agent...

NET STOP teagent
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "IPv4"^|Find "172"') do set ip=%%b
set ip=%ip:~1%
echo %ip%
echo tw.rpc.interfaceAddr=%ip%>> "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"
echo java.rmi.server.hostname=%COMPUTERNAME%.lowes.com>> "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"

NET START teagent

GOTO END

@echo **********************************

:INSTALL64
%WINDIR%\system32\msiexec.exe /i "C:\Windows\Installer\te_agent64.msi" /passive /L*V "C:\Windows\TripwireInstall.log" TE_SERVER_HOSTNAME=lxvrdctrp1.lowes.com TE_SERVER_PORT=9898 SERVICES_PASSWORD=tripwire_rdc START_AGENT=true INSTALL_RTM=false ACCEPT_EULA=true
@echo.
@echo **********************************
@echo Loaded 64 BIT install for Tripwire 8.3.7
@echo Now updating agent... 

NET STOP teagent
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "IPv4"^|Find "172"') do set ip=%%b
set ip=%ip:~1%
echo %ip%
echo tw.rpc.interfaceAddr=%ip%>> "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"
echo java.rmi.server.hostname=%COMPUTERNAME%.lowes.com>> "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"

NET START teagent

GOTO END
 

:END
@echo.
@echo *********************************************
@echo Tripwire Agent  8.3.7 Installation Complete !
@echo *********************************************
@echo After completion of install, launch cmtrace.exe and
@echo open the Tripwire Agent Log ("C:\Program Files\Tripwire\TE\Agent\data\log\teagent.log")
@echo to verify that the agent can connect to the Management Console.
@echo.\PAUSE
CALL notepad "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"

CALL cmtrace.exe "C:\Program Files\Tripwire\TE\Agent\data\log\teagent.log"

Exit