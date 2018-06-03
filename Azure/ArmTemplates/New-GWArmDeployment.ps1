<#
.SYNOPSIS
    Short description
.DESCRIPTION
    Long description
.EXAMPLE
    PS C:\> <example usage>
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
    # Template File Path
    [Parameter(Mandatory=$true)]
    [string]
    $templateFilePath,
    # Template Parameter File Path
    [Parameter(Mandatory=$true)]
    [string]
    $templateParamterFilePath  
)

# Login

#

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
                                   -TemplateFile $templateFilePath `
                                   -TemplateParameterFile $templateParamterFilePath

