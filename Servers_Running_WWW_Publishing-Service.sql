SELECT
A.Name0 AS 'Server Name',
H.Caption0 AS 'OS Version',
H.CSDVersion0 AS 'Service Pack Level',
I.DisplayName0 as 'Service Name',
I.Status0 as 'Service Status',
I.StartMode0 as 'Start Mode',
I.PathName0
FROM
v_GS_COMPUTER_SYSTEM A,
v_GS_OPERATING_SYSTEM H,
v_GS_SERVICE I


WHERE

A.ResourceID = H.ResourceID AND
A.ResourceID = I.ResourceID AND 
H.CAPTION0 like '%server 2003%' AND
I.DisplayName0 like'%Web Publishing%'
GROUP BY A.Name0, H.Caption0, H.CSDVersion0, I.DisplayName0, I.Status0, I.StartMode0, I.PathName0  