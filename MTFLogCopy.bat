rem  copy MTF Logs from msvprdwmsapp02\d$\jda\wms\les\log\  to
rem \\Msvdevwmsapp01\d$\JDA\WMS\LES\temp\PROD-LOG\PROD2\MTF-LOG\   for every 30 min.
rem  Create a scheduled Task to run every 30 minutes
rem  Copied 7-zip.exe and dlls into \Windows\system32
rem  ************************************************************************************************

COPY d:\jda\wms\les\log\mtf_server*.* D:\Logtemp /Y 
C:\
CD \
CD %WINDIR%\system32
7z a d:\Logtemp\logs.zip "d:\Logtemp\mtf_server*" 
Ren D:\Logtemp\Logs.zip "%COMPUTERNAME%_%DATE:~4,2%%DATE:~7,2%%DATE:~10,4%_%TIME:~-11,2%hr%TIME:~-8,2%min%TIME:~-5,2%sec.zip"
COPY d:\Logtemp\*.zip "\\Msvdevwmsapp01\d$\JDA\WMS\LES\temp\PROD-LOG\PROD2\MTF-LOG
ping localhost -n 10 > Nul
D:
CD \
CD Logtemp
Del *.zip
Del mtf_server*
exit



