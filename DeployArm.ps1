#We can deploy ARM templates using Portal, Azure CLI or PowerShell
#Make sure to set the admin password parameter in parameters.json file (approx line 70 - 80)
#Once finished, look for ProvisioningState Succeeded.

New-AzResourceGroupDeployment `
    -Name mydeployment -ResourceGroupName "psdemo-rg" `
    -TemplateFile "./ARM_template/template.json" `
    -TemplateParameterFile "./ARM_template/parameters.json"