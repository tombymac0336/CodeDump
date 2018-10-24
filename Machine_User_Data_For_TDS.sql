Select SYS.Netbios_Name0 as 'Machine Name', SYS.User_Name0 as 'Username', v_R_User.lowes_salesmannumber0 as 'Saleman',
   v_R_User.mail0 as 'email', v_R_User.Telephonenumber0 as 'Phone', v_R_User.title0 as 'Title', v_R_User.ExtensionAttribute50 As 'Dept #', v_R_User.Department0 As
  'Dept Name', v_R_User.extensionattribute70 as 'Site No.', SB.SerialNumber0 as 'Serial Number', 
   SYS.Operating_System_Name_and0 as 'OS',   
  SE.ChassisTypes0,v_FullCollectionMembership.CollectionID
From v_R_System SYS Inner Join
  v_GS_PC_BIOS SB On SYS.ResourceID = SB.ResourceID Inner Join
  v_R_User On SYS.User_Name0 = v_R_User.User_Name0 Inner Join
  v_GS_SYSTEM_ENCLOSURE SE On SYS.ResourceID = SE.ResourceID
INNER JOIN v_FullCollectionMembership ON SYS.ResourceID = v_FullCollectionMembership.ResourceID
WHERE     (v_FullCollectionMembership.CollectionID = 'C0200056') AND SE.ChassisTypes0 <> 21

Group BY SYS.Netbios_Name0, SB.SerialNumber0,  SYS.User_Name0, v_R_User.lowes_salesmannumber0, v_R_User.mail0, v_R_User.Department0, v_R_User.ExtensionAttribute50, v_R_User.title0, v_R_User.Telephonenumber0, SYS.Operating_System_Name_and0, v_R_User.extensionattribute70, SE.ChassisTypes0, v_FullCollectionMembership.CollectionID   