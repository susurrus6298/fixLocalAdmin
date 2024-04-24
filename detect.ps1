## get the PC's local admin group membership and computer information

$GroupName = "Administrators"
$computer = Get-WmiObject Win32_ComputerSystem
$members = net localgroup $GroupName
$CurrentUser = whoami.exe

## check for improper group membership and specific domain

if ($computer.Domain -eq "<domain.local>" -and $members -contains $CurrentUser) {
    Write-Output "Qualifications met, will run remediation."
    exit 1
}
else {
    Write-Output "Qualifications not met, will not run remediation."
	exit 0
}