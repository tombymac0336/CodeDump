

IF NOT EXIST "C:\Program Files\Tripwire" GOTO NOAGENT
GOTO UPDATEAGENT


:UPDATEAGENT
NET STOP teagent
SET TRIPDIR="C:\Program Files\Tripwire\TE\Agent\data\config"
DEL %TRIPDIR%\agent.properties /Q
COPY \\msinstall\pkg_source\Client\Tripwire_837\agent.properties %TRIPDIR% /Y
@echo ************************
ping localhost -n 1
@echo ************************
ipconfig | find "10."
COPY \\msinstall\patches\cmtrace.exe C:\Windows /Y

for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "IPv4"^|Find "10.128"') do set ip=%%b
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
@ECHO  No Tripwire Agent installed to update...
Exit