param([string]$SMTPDomain="", [string]$FilePath="", [int]$Max=50) 

#
# Requires User is a member of the ImportExport Role
# New-ManagementRoleAssignment –Role "Mailbox Import Export" –User "user name"

$limit = 0 # reset limit on first run
$mailboxes = Get-Mailbox | Where-Object {$_.EmailAddresses -like "*"+$SMTPDomain} | Select-Object Alias

foreach ($mailbox in $mailboxes)
{

	if ($limit -ne $Max)
	{
		
		$Filename = $FilePath + "\" + $mailbox.Alias + ".pst"
		New-MailboxExportRequest -Mailbox $mailbox.alias -IncludeFolders "#Calendar#","#Contacts#" -FilePath $Filename
	}
	else
	{
		break
	}
	$limit++
}