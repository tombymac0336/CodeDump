SELECT     v_R_System.Name0, v_Update_ComplianceStatus.Status, v_UpdateInfo.BulletinID, v_UpdateInfo.ArticleID, v_UpdateInfo.Description, v_UpdateInfo.Title,
                       v_UpdateInfo.DatePosted
 FROM         v_R_System INNER JOIN
                       v_Update_ComplianceStatus ON v_R_System.ResourceID = v_Update_ComplianceStatus.ResourceID INNER JOIN
                       v_UpdateInfo ON v_Update_ComplianceStatus.CI_ID = v_UpdateInfo.CI_ID
 WHERE     (v_R_System.Name0 like 'DCO%') AND (v_Update_ComplianceStatus.Status = 2) AND (v_UpdateInfo.DatePosted <= CONVERT(DATETIME, '2015-01-01 00:00:00', 102))