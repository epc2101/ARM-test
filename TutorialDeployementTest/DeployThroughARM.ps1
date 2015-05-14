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
    "scriptUri"= "https://raw.githubusercontent.com/epc2101/ARM-test/master/TutorialDeployementTest/Get-AzureVMTutorial.ps1";
    "runbookDescription" =  "Description";
    "credentialName" = "BethsNonworkingCred";
	"userName" = "MyFakeUsername"; 
	"password" = "MyPassword";
	"credentialDescription" = "Description" 
}
$TemplateURI = "https://github.com/epc2101/ARM-test/blob/master/TutorialDeployementTest/deployAutomationResources.json"

New-AzureResourceGroupDeployment -TemplateParameterObject $Params -ResourceGroupName "bethgroup1" -TemplateUri $TemplateURI
 

