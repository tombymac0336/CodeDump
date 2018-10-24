@ECHO OFF

@echo ***********************************************
@echo This script updates the agent.properties file
@echo for the Tripwire 8.3.7 Agent
@echo Run this script on PHYSICAL servers with
@echo MULTIPLE Network Adapters ONLY.
@echo Press Cntrl C if you would like to Cancel.
@echo ***********************************************
PAUSE

IF NOT EXIST "C:\Program Files\Tripwire" GOTO NOAGENT

CALL notepad "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"

CLS
:MENU
echo ****************************************************** 
echo Press 1 to Continue with the update
echo Press 2 to Exit (if IP and FQDN update is not needed)
echo ******************************************************

SET /P M=Type 1,2 and then press Enter
IF %M%==1 GOTO APPINSTALLED
IF %M%==2 GOTO NOTNEEDED

@echo off
IF NOT EXIST "C:\Program Files\Tripwire" GOTO NOAGENT
SET DIRTRIPWIRE="C:\Program Files\Tripwire"
IF EXIST %DIRTRIPWIRE% GOTO APPINSTALLED

:APPINSTALLED
@echo The Tripwire agent is installed and will be updated...
@echo to support multi-NIC systems 
GOTO UPDATEAGENT


:UPDATEAGENT
NET STOP teagent
@echo ************************
ping localhost -n 1
@echo ************************
ipconfig | find "172."
COPY \\msinstall\patches\cmtrace.exe C:\Windows /Y

for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "IPv4"^|Find "172"') do set ip=%%b
set ip=%ip:~1%
echo %ip%

echo tw.rpc.interfaceAddr=%ip%>> "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"
echo java.rmi.server.hostname=%COMPUTERNAME%.lowes.com>> "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"
PAUSE
CALL notepad "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"
NET START teagent
CALL cmtrace.exe "C:\Program Files\Tripwire\TE\Agent\data\log\teagent.log"
EXIT

:NOAGENT
@echo *********************************************************************
@echo  There is no Tripwire agent on this server. It will be installed now 
@echo Member Server and Domain Controller Installs can be found here: 
@echo \\msinstall\patches\Tripwire_837
@echo ********************************************************************* 

PAUSE
CALL \\msinstall\patches\Tripwire_837\Install_TripwireMemberServer.bat
PAUSE
CALL notepad "C:\Program Files\Tripwire\TE\Agent\data\config\agent.properties"
CALL cmtrace.exe "C:\Program Files\Tripwire\TE\Agent\data\log\teagent.log"
EXIT


:NOTNEEDED
@echo ***************************************************************
@echo The Tripwire agent is already updated with correct IP and FQDN
COPY \\msinstall\patches\cmtrace.exe C:\Windows /Y
@echo Restarting Agent...
NET STOP teagent
NET START teagent
CALL cmtrace.exe "C:\Program Files\Tripwire\TE\Agent\data\log\teagent.log"
@echo ***************************************************************

PAUSE
EXIT

