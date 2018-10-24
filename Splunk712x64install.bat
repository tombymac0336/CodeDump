%WINDIR%\system32\msiexec.exe /i %~dp0splunkforwarder712_x64.msi /l*v "C:\Windows\Temp\SplunkInstall.log" AGREETOLICENSE=yes /quiet
COPY %~dp0csl_deployment_server.cab C:\Windows\Temp /Y >> C:\Windows\Temp\SplunkCABCopy.log 2>&1
C:
CD\
CD Windows\Temp
EXPAND csl_deployment_server.cab -F:* "C:\Program Files\SplunkUniversalForwarder\etc\apps" >> C:\Windows\Temp\SplunkCABCopy.log 2>&1
C:
CD\
CD Windows\system32
sc STOP SplunkForwarder >> C:\Windows\Temp\SplunkCABCopy.log 2>&1
Ping 127.0.0.1 -n 15 > NUL
sc START SplunkForwarder >> C:\Windows\Temp\SplunkCABCopy.log 2>&1
Ping 127.0.0.1 -n 15 > NUL
@echo %COMPUTERNAME% -- %PROCESSOR_ARCHITECTURE% cpu -- %DATE% -- %TIME% >> C:\Windows\Temp\SplunkCABCopy.log 2>&1