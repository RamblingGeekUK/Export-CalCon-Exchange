
<#PSScriptInfo

.VERSION 0.2

.GUID 6de48057-fd1d-4c58-9039-205de13b3f02

.AUTHOR wayne@ramblinggeek.co.uk

.COMPANYNAME 

.COPYRIGHT 

.TAGS 

.LICENSEURI 

.PROJECTURI https://github.com/RamblingGeekUK/Export-CalCon-Exchange

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES


#>

<# 

.DESCRIPTION 
 A script to loop through Exchange Mailboxes and export Contacts and Calendars 

#> 

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
    # increase count
	$limit++
}

