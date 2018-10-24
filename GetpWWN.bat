fcinfo.exe /details >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1
Echo --------------------------------------------------- >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1
Echo Emulex HBA pWWN captured on %DATE% at %TIME% on system %COMPUTERNAME% >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1
Echo with %PROCESSOR_ARCHITECTURE% proc type and %NUMBER_OF_PROCESSORS% procs >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | FIND "ProductName" >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1 
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v RegisteredOrganization | FIND "RegisteredOrganization" >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1 
Echo --------------------------------------------------- >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1
Echo IP and MAC Info >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1
Echo --------------------------------------------------- >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1

Ping %COMPUTERNAME% -n 1 | FIND "Reply" >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1 
GetMac | FIND "\Device\Tcpip" >> \\msvpcmcdp01\HBAinfo_ARCHIVE\%COMPUTERNAME%_HBA.txt 2>&1


REM  ver. 1.1  tgm  7-18-2014




