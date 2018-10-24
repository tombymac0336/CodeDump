# ==============================================================================================
# 
# Microsoft PowerShell Source File -- Created with SAPIEN Technologies PrimalScript 2009
# 
# NAME: 
# 
# AUTHOR: Lowes Companies , Lowes Companies
# DATE  : 8/20/2010
# 
# COMMENT: 
# 
# ==============================================================================================

write-host
# write-host "ShowPrnH.ps1,  Version 1.01"
write-host ****************************************************************
write-host "Showing available printers in your web browser"
write-host "Lowes Printer Display"
write-host "These printers are currently installed on your workstation"
write-host *****************************************************************

get-wmiobject -class Win32_Printer | convertto-html Name,Default,Network,PortName,DriverName,ServerName,ShareName -head "<title>All printers available on $env:computername</title>`n<style type=`"text/css`">`nbody { padding: 8px; line-height: 1.33 }`ntable { border-style: ridge }`ntd, th { padding: 10px; border-style: dotted; border-width: 1px }`nth { font-weight: bolder; text-align: center }`n</style>" | out-file -FilePath "showprnh.html" -Encoding "ASCII"
invoke-item "showprnh.html"

 