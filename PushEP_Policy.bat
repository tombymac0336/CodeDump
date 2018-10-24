
@echo ********************************************************
@Echo Manually Update SCEP Policy via locally copied XML file
@echo *********************************************************

COPY \\msvpcmcas00\client2\AVPolicy\LowesDefault_C01Srv.xml C:\Windows\ /Y
PAUSE
C:
CD \
CD Program Files
CD Microsoft Security Client
configSecurityPolicy.exe "C:\Windows\LowesDefault_C01Srv.xml"
PAUSE
Exit
