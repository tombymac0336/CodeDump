
Copy UniversalForwarder folder to the local client.
From an administrative command prompt, run the Splunk712x64install.bat file

This performs the agent installation, creates install log in %WINDOR%\Temp, updates the app with the csl_deployment_server folder,
and lastly restarts the SplunkForwarder service.  No server restart is necessary.  Ensure you have at least 250 MB of free space on C volume
as this app will use approx. 150 MB.
Installation Complete:

To validate:
Ensure SplunkForwarder service is running, under LocalSystem, with startupmode set to Automatic.
Ensure the C:\Program Files\SplunkUniversalForwarder\etc\apps\csl_deployment_server folder exists and contains the Lowes specific config
files for connectivity to the Indexers.
If server is in a DMZ ensure that the appropriate TCP ports are opened for the client to communicate to the Master Deployment Server.
Contact  vc.sravankumar.Yedudodla@lowes.com  on the Splunk Team and have him verify that the client is communicating to the 
Master Deployment Server on the back end. 

At a later date the NXLOG service can be stopped on the client, and startup mode set to Disabled.
The NXLog agent will not be uninstalled at this time.


Thommy McNeil
09-06-2018