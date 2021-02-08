export LOCATION=eastus
export RESOURCE_GROUP=batchRG
export SA_NAME=rafbatchsa
export BATCH_ACC_NAME=rafbatchacc

#creat resource group
az group create \
    --name $RESOURCE_GROUP \
    --location $LOCATION

#create storage account
az storage account create \
    --resource-group $RESOURCE_GROUP \
    --name $SA_NAME \
    --location $LOCATION \
    --sku Standard_LRS

az batch account create \
    --name $BATCH_ACC_NAME \
    --storage-account $SA_NAME \
    --resource-group $RESOURCE_GROUP\
    --location $LOCATION

az batch account login \
    --name $BATCH_ACC_NAME \
    --resource-group $RESOURCE_GROUP \
    --shared-key-auth

