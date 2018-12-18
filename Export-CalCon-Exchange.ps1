param([string]$SMTPDomain="", [string]$Mailbox="", [string]$FilePath="") #

# Requires User is a member of the ImportExport Role

$tmpCount = 2 

$mailboxes = Get-Recipient | Select-Object Alias

foreach ($mailbox in $mailboxes)
{
	
	if ($tmpCount -eq 2)
	{
		$Filename = $FilePath + "\" + $mailbox.Alias + ".pst"
		New-MailboxExportRequest -Mailbox $mailbox.Alias -IncludeFolders "#Calendar#","#Contacts#" -FilePath $Filename
		break
	}
}