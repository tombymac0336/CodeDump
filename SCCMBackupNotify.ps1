$msgBackup = Get-Content \\mscmcprdps01\Backup\backupstatus.txt | Select-Object -last 1  

$DCO_email='dl-go-sql-server@lowes.com'
$cc_emails='thomas.g.mcneil@lowes.com','thommy.mcneil@gmail.com','Josh.L.Abercrombie@lowes.com','Timothy.B.Hanson@lowes.com'
$msgMailServer="OUTLOOK-USNCCORP01.lowes.com"
$msgSubject="Update - SCCM Site Server Backup"
$msgBody=  $msgBackup
send-mailmessage -to $DCO_email -Cc $cc_emails -from $DCO_email -subject $msgSubject -body $msgBody -smtpServer $msgMailServer