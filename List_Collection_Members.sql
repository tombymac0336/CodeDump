
SELECT
A.Name AS 'ServerName',
A.SiteCode AS 'SCCM Site',
A.Domain AS 'Domain Member',
B.AD_Site_Name0 as 'AD Site'

FROM
v_FullCollectionMembership A,
v_R_System B

WHERE
A.ResourceID = B.ResourceID AND

CollectionID = 'CAS00AF1'