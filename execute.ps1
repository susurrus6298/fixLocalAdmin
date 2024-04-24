## Get group membership
## uses net instead of Get-xxx because of a known issue with unresolvable SIDs

$GroupName = "Administrators"
$members = net localgroup $GroupName
$CurrentUser = whoami.exe
# $AdminUser = <new_admin_user> ## Optional

## optionally add a specific user as local admin explicitly first

# if ($members -notcontains $user){
#     Add-LocalGroupMember -Group $GroupName -Member $AdminUser
# }

## Remove improper admin group membership

if ($members -contains $CurrentUser){
    Remove-LocalGroupMember -Group $GroupName -Member $CurrentUser
}

## optional - reboot the PC

# Restart-Computer