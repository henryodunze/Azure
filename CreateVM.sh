#Azure CLI
#AZ-204

#Login interactively and set a subscription to be the current active subscription.
az login
az account set --subscription "Visual Studio Professional Subscription"

#Create Windows VM.
az group list -o table

#Create a resource group if needed.
az group create \
    --name "myDemo-rg" \
    --location "eastus"

#Create a Windows VM.
az vm create \
    --resource-group "myDemo-rg" \
    --name "myDemo-win-cli" \
    --image "win2019datacenter" \
    --admin-username "demoadmin" \
    --admin-password "password12!"

#Open RDP for remote access.
az vm open-port \
    --resource-group "myDemo-rg" \
    --name "myDemo-win-cli" \
    --port "3389"

#Create a Linux VM
az vm create \
    --resource-group "myDemo-rg" \
    --name "myDemo-linux-cli" \
    --image "UbuntuLTS" \
    --admin-username "demoadmin" \
    --authentication-type "ssh" \
    --ssh-key-value ~/.ssh/id_rsa.pub #or use --generate-ssh-keys

#Open SSH for remote access.
az vm open-port \
    --resource-group "myDemo-rg" \
    --name "myDemo-linux-cli" \
    --port "22"

#login into linux VM over SSH 
ssh azureuser@publicIPaddress

#Clean up resources in demo group
az group delete --name "myDemo-rg"

#Get the public IP address for remote access.
az vm list-ip-address \
    --resource-group "myDemo-rg" \
    --name "myDemo-win-cli" \
    --output table