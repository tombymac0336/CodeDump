SELECT                      SYS.Netbios_Name0 AS [Server Name], SYS.Operating_System_Name_and0 AS [OS], v_GS_OPERATING_SYSTEM.CSDVersion0 AS [Service Pack], SF.FileName, SF.FileDescription, 
                      SF.FileVersion, SF.FileSize, SF.FileModifiedDate, SF.FilePath
FROM         v_GS_SoftwareFile SF INNER JOIN
                      v_FullCollectionMembership ON SF.ResourceID = v_FullCollectionMembership.ResourceID INNER JOIN
                      v_R_System SYS ON SYS.ResourceID = SF.ResourceID INNER JOIN
                      v_GS_OPERATING_SYSTEM ON SYS.ResourceID = v_GS_OPERATING_SYSTEM.ResourceID
                      
WHERE     (v_FullCollectionMembership.CollectionID like 'CAS000DD') AND (SF.FileName LIKE 'iexplore.exe')
 AND (SF.FilePath LIKE 'C:\program files%') AND (SF.FileVersion LIKE '%')
ORDER BY SYS.Netbios_Name0