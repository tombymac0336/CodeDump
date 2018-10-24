CD\
D:
cd JDA\WMS\LES\files\hostout
ren inp OLD_inp
PAUSE
mklink /D "D:\JDA\WMS\LES\files\hostout\inp" \\msfsprod02\wmsprod\outbound
PAUSE
dir /AL /S D:\

@Echo  Start Creating the second symlink next
PAUSE

CD\
D:
cd JDA\WMS\LES\files\hostout
ren prc OLD_prc
PAUSE
mklink /D "D:\JDA\WMS\LES\files\hostout\prc" \\msfsprod02\wmsprod\outbound\prc
PAUSE
dir /AL /S D:\
PAUSE