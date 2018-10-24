SELECT     v_R_System.Name0 AS 'Server_Name', v_Update_ComplianceStatus.Status AS 'Install_Status', v_UpdateInfo.BulletinID, v_UpdateInfo.ArticleID, v_UpdateInfo.Description, v_UpdateInfo.Title,
                       v_UpdateInfo.DatePosted
 FROM         v_R_System INNER JOIN
                       v_Update_ComplianceStatus ON v_R_System.ResourceID = v_Update_ComplianceStatus.ResourceID INNER JOIN v_FullCollectionMembership AS FCM On v_R_System.ResourceID  = FCM.ResourceID
                       INNER JOIN v_UpdateInfo ON v_Update_ComplianceStatus.CI_ID = v_UpdateInfo.CI_ID  
 WHERE     (FCM.CollectionID = 'CAS00813'AND v_Update_ComplianceStatus.Status = 2) AND (v_UpdateInfo.DatePosted <= CONVERT(DATETIME, '2015-02-01 00:00:00', 102)) 