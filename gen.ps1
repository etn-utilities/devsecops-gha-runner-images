Import-Module .\helpers\GenerateResourcesAndImage.ps1 -Force 
$Env:PACKER_LOG = 1
GenerateResourcesAndImage -SubscriptionId 9013acaf-d6cc-4416-a9ed-7075ba759979 -ResourceGroupName ETN-ES-EAS-DEVSECOPS-PACKER -ImageType   Windows2022Base  -AzureLocation "East US" -AzureClientId 52563be7-6764-4964-b3dc-beb18e7623d2 -AzureClientSecret "~H48Q~tiI1SZXH~GNq8SdqSI_9yXS124.GjHNb8Q"  -AzureTenantId d6525c95-b906-431a-b926-e9b51ba43cc4 -VirtualNetworkName vnet-yukon-sbx-eus -VirtualNetworkResourceGroupName "ETN-ES-Yukon-Infra-Primary" -VirtualNetworkSubnetName AppSubnet -GalleryName "packer_gallery"  
