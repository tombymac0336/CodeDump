SELECT
A.Name0 AS 'Server Name',
A.Model0 AS 'Platform (VMWare or HP Proliant)',
H.Caption0 AS 'Server Operating System',
H.CSDVersion0 AS 'Service Pack Level',
--J.DisplayName0 AS 'SCCM',
J.Version0 AS 'SCCM Client Version (5.0=2012)',
--K.Version AS 'Microsoft SCEP version',
H.LastBootUpTime0 as 'Last Bootup',
H.InstallDate0 AS 'System Build Date',
A.Manufacturer0 AS 'Manufacturer', 
C.Name0 AS 'Processor Type and Speed',
--C.DeviceID0 AS 'CPU ID',
C.NumberOfCores0 AS 'Number of CPU Cores',
C.NumberOfLogicalProcessors0 AS 'Logical Procs',
MAX ( E.Size0 ) AS 'Size (Memory in MBytes)',
G.AD_Site_Name0 AS 'AD Site',
MAX (B.SerialNumber0) AS 'Serial Number',
I.LastHWScan,
MAX (F.IPAddress0) AS 'IP Address'
 
FROM
v_GS_COMPUTER_SYSTEM A,
v_GS_PC_BIOS B,
v_GS_PROCESSOR C,
v_GS_X86_PC_MEMORY D,
v_GS_DISK E,
v_GS_NETWORK_ADAPTER_CONFIGUR F,
v_R_System G,
v_GS_OPERATING_SYSTEM H,
v_GS_WORKSTATION_STATUS I,
v_GS_SMS_ADVANCED_CLIENT_STATE J
--v_GS_AntimalwareHealthStatus K



WHERE
A.ResourceID = B.ResourceID AND
A.ResourceID = C.ResourceID AND
A.ResourceID = D.ResourceID AND
A.ResourceID = E.ResourceID AND
A.ResourceID = F.ResourceID AND
A.ResourceID = G.ResourceID AND
A.ResourceID = H.ResourceID AND
A.ResourceID = I.ResourceID AND
A.ResourceID = J.ResourceID AND
--A.ResourceID = K.ResourceID AND
 H.CAPTION0 like '%server%' AND
 J.DisplayName0 like 'CCM Framework'
GROUP BY A.Name0, A.Manufacturer0, A.Model0,C.Name0, C.NumberOfCores0,C.NumberOfLogicalProcessors0,
D.TotalPhysicalMemory0, G.AD_Site_Name0, H.Caption0, H.CSDVersion0, H.InstallDate0,I.LastHWScan, J.Version0, H.LastBootUpTime0