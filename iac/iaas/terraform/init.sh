#!/bin/bash
#az group create --location eastus -n rg-cka-iac
az storage account create -n spyckaiac -g rg-cka-iac -l eastus --sku Standard_LRS
az storage container create -n tfstate --resource-group rg-cka-iac --account-name spyckaiac
az storage account generate-sas --account-name spyckaiac --expiry 2022-01-01 --https-only --permissions acdlpruw --resource-types co --services bfqt