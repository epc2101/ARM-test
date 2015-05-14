$JobGUID = [System.Guid]::NewGuid().toString()
$AccountName = "Ignite-Demo"

<#$Params = @{"accountName" = $AccountName ;
    "credentialName" = "DefaultAzureCredential";
    "location" = "Japan East";
    "JobName" = $JobGUID}
#>

#Use Azure resource Manager to deploy template 
Switch-AzureMode -Name AzureResourceManager
$Params = @{"accountName" = $AccountName ;
    "JobName" = $JobGUID;
    "regionId" = "Japan East";
	"runbookName" = "Get-AzureVMTutorial";
    "scriptCenterUri"= "http://eus2oaasibizamarketprod1.blob.core.windows.net/marketplace-runbooks/Get-AzureVMTutorial.ps1";
    "runbookDescription" =  "Description";
    "credentialName" = "BethsNonworkingCred";
	"userName" = "MyFakeUsername"; 
	"password" = "MyPassword";
	"credentialDescription" = "Description" 
}
$Path = "C:\Users\elcooper\Documents\AccountPlusCred.json"

New-AzureResourceGroupDeployment -TemplateParameterObject $Params -ResourceGroupName "bethgroup1" -TemplateFile $Path
 

