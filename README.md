# Export-CalCon-Exchange.ps1
This is a collection of PowerShell Scripts that I have written to help along the way prerequisites 
*	Requires to be run with a user who is a member of the ImportExport Role (I would of thought an Exchange admin should already have this right) 
*	New-ManagementRoleAssignment –Role "Mailbox Import Export" –User "user name"
*	A share on the server 

How To Use 
              
*	Download script from link above
*	Open Exchange PowerShell
*	Check Your Current Execution Policy with “Get-ExecutionPolicy”, make a note of it, it should be site to remote Signed, now run “Set-ExecutionPolicy Unrestricted”
*	Move to the folder with the script and run the following 
* .\Export-CalCon-Exchange.ps1 -SMTPDomain "@domain.com" -FilePath "\\servername\sharename" -Max 3
*	Change Server name and share name to your server name and the share you have created for the exported files to be written to.
* Change the @domain.com to the domain mailboxes you want to export
*	Max 3, will limit it to the first 3 mailboxes to test all is working, removing this defaults to 50 mailboxes
*	If the command runs and works you will get a message back listing the mailboxes queued up for the exports
*	Important, once done, Set your execution policy on your server back to RemoteSigned, using “Set-ExecutionPolicy <Your Policy, you made a note of it>“
