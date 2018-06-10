<#
.SYNOPSIS
    Deploys an Azure Resource Group
.DESCRIPTION
    Deploys an Azure Resource Group using an ARM template and parameter files. 
    A new resource group is created if one it doesn't currently exist in the subscription.
    A test run day be performed for validation purposes.
.EXAMPLE
    PS C:\> New-AzureRmResourceGroup -resourceGroupName rg-test -location westeurope -templateFilePath C:\Template.json 
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
param(
    # Resource Group Name
    [Parameter(Mandatory=$true)]
    [string]
    $resourceGroupName,
    # Resource Location
    [Parameter(Mandatory=$true)]
    [string]
    $location,
    # Template File Path
    [Parameter(Mandatory=$true)]
    [string]
    $templateFilePath,
    # Template Parameter File Path
    [Parameter(Mandatory=$true)]
    [string]
    $templateParamterFilePath,
    # Parameter help description
    [switch]
    $dryRun  
)

# Login
Connect-AzureRmAccount

# Create or update the resource group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $location -Verbose -Force

if ($dryRun) {
    $errors = Test-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFilePath `
    -TemplateParameterFile $templateParamterFilePath

    Write-Output $errors
}else{
    New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -TemplateFile $templateFilePath `
    -TemplateParameterFile $templateParamterFilePath
}


