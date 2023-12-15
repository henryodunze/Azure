#Azure PowerShell
#AZ-204

#Login to Azure account
Connect-AzAccount -SubscriptionName "Visual Studio Professional Subscription"

#Ensure you're pointed at your correct subscription
Set-AzContext -SubscriptionName "Visual Studio Professional Subscription"

#Create a resource group
New-AzResourceGroup -Name "psdemo-rg" -Location "eastus"

#Get resource group if needed.
Get-AzResourceGroup `
    -Name "psdemo-rg"
    -Location "eastus"

#Create PS credential object for Azure VM
$username = "demoadmin"
$password = ConvertTo-SecureString "password1234!" -AsPlainText -Force
$WindowsCred = New-Object System.Management.Automation.PSCredential ($username, $password)

#Create VM
New-AzVM `
    -ResourceGroupName "psdemo-rg" `
    -Name "psdemo-win-az" `
    -Image "Win2019Datacenter" `
    -Credential $WindowsCred `
    -OpenPorts 3389

#Get the public IP address
Get-AzPublicIpAddress -ResourceGroupName "myVM_rg" -Name "myVM-ip" | Select-Object IpAddress

#Clean up after demo
Remove-AzResourceGroup -Name "psdemo-rg"
