@echo off
cls

if "%PROCESSOR_ARCHITECTURE%"=="x86" goto 32BIT
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT
goto END


:32BIT
echo 32-bit OS...
echo Installing SCOM 2012 Agent, please wait...
%windir%\system32\msiexec.exe /i \\msinstall\ntfiles\SCOM_Agent_Install\OM2012\x32\MOMAgent.msi /qn /l*v C:\SCOMAgentInstall.log AcceptEndUserLicenseAgreement=1 USE_SETTINGS_FROM_AD=0 ACTIONS_USE_COMPUTER_ACCOUNT=1

REM Wait 10 seconds for install to complete
ping -n 11 127.0.0.1 > nul

echo.
echo Adding SCOM 2012 Management Group, please wait...
%windir%\system32\cscript.exe //nologo \\msinstall\ntfiles\SCOM_Agent_Install\Add_SCOM_MG.vbs

REM Wait 10 seconds for script to complete
ping -n 11 127.0.0.1 > nul

REM echo.
REM echo Adding SCOM 2007 Management Group, please wait...
REM %windir%\system32\cscript.exe //nologo \\msinstall\ntfiles\SCOM_Agent_Install\Add_SCOM_2007_MG.vbs

REM REM Wait 10 seconds for script to complete
REM ping -n 11 127.0.0.1 > nul

echo.
echo Installing SCOM 2012 Agent Patch 1, please wait...
%windir%\system32\msiexec.exe /p \\msinstall\ntfiles\SCOM_Agent_Install\OM2012\x32\KB2784734-i386-Agent.msp /qn /l*v C:\SCOMAgentKB2784734.log

REM Wait 10 seconds for install to complete
ping -n 11 127.0.0.1 > nul

echo.
echo Installing SCOM 2012 Agent Patch 2, please wait...
%windir%\system32\msiexec.exe /p \\msinstall\ntfiles\SCOM_Agent_Install\OM2012\x32\KB2826664-i386-Agent.msp /qn /l*v C:\SCOMAgentKB2826664.log

echo.
echo Install finished.
echo Check C:\SCOMAgentInstall.log, C:\SCOMAgentKB2784734.log and C:\SCOMAgentKB2826664.log for any errors.
goto END


:64BIT
echo 64-bit OS...
echo Installing SCOM 2012 Agent, please wait...
%windir%\system32\msiexec.exe /i \\msinstall\ntfiles\SCOM_Agent_Install\OM2012\x64\MOMAgent.msi /qn /l*v C:\SCOMAgentInstall.log AcceptEndUserLicenseAgreement=1 USE_SETTINGS_FROM_AD=0 ACTIONS_USE_COMPUTER_ACCOUNT=1

REM Wait 10 seconds for install to complete
ping -n 11 127.0.0.1 > nul

echo.
echo Adding SCOM 2012 Management Group, please wait...
%windir%\system32\cscript.exe //nologo \\msinstall\ntfiles\SCOM_Agent_Install\Add_SCOM_MG.vbs

REM Wait 10 seconds for script to complete
ping -n 11 127.0.0.1 > nul

REM echo.
REM echo Adding SCOM 2007 Management Group, please wait...
REM %windir%\system32\cscript.exe //nologo \\msinstall\ntfiles\SCOM_Agent_Install\Add_SCOM_2007_MG.vbs

REM REM Wait 10 seconds for script to complete
REM ping -n 11 127.0.0.1 > nul

echo.
echo Installing SCOM 2012 Agent Patch 1, please wait...
%windir%\system32\msiexec.exe /p \\msinstall\ntfiles\SCOM_Agent_Install\OM2012\x64\KB2784734-amd64-Agent.msp /qn /l*v C:\SCOMAgentKB2784734.log

REM Wait 10 seconds for install to complete
ping -n 11 127.0.0.1 > nul

echo.
echo Installing SCOM 2012 Agent Patch 2, please wait...
%windir%\system32\msiexec.exe /p \\msinstall\ntfiles\SCOM_Agent_Install\OM2012\x64\KB2826664-AMD64-Agent.msp /qn /l*v C:\SCOMAgentKB2826664.log

echo.
echo Install finished.
echo Check C:\SCOMAgentInstall.log, C:\SCOMAgentKB2784734.log and C:\SCOMAgentKB2826664.log for any errors.
goto END


:END
echo.
pause
