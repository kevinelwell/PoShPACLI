Function Update-SafeFileCategory{

    <#
    .SYNOPSIS
    	Update an existing File Category at Safe level

    .DESCRIPTION
    	Exposes the PACLI Function: "UPDATESAFEFILECATEGORY"

    .PARAMETER vault
        The name of the Vault containing the Safe where the File Category is 
        defined.
        
    .PARAMETER user
        The Username of the User carrying out the task.
        
    .PARAMETER safe
        The Safe where the File Categories will be updated.
        
    .PARAMETER category
        The current name of the File Category.

    .PARAMETER categoryNewName
        The new name of the File Category.

    .PARAMETER validValues
        The valid values for the File Category.

    .PARAMETER defaultValue
        The default value for the File Category.
        
    .PARAMETER required
        Whether or not the File Category is a requirement when storing a file in 
        the Safe.

    .PARAMETER sessionID
    	The ID number of the session. Use this parameter when working
        with multiple scripts simultaneously. The default is ‘0’.

    .EXAMPLE
    	A sample command that uses the function or script, optionally followed
    	by sample output and a description. Repeat this keyword for each example.

    .NOTES
    	AUTHOR: Pete Maan
    	LASTEDIT: January 2015
    #>
    
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory=$True)][string]$vault,
        [Parameter(Mandatory=$True)][string]$user,
        [Parameter(Mandatory=$False)][String]$safe,
        [Parameter(Mandatory=$True)][string]$category,
        [Parameter(Mandatory=$False)][String]$categoryNewName,
        [Parameter(Mandatory=$False)][String]$validValues,
        [Parameter(Mandatory=$False)][String]$defaultValue,
        [Parameter(Mandatory=$False)][Switch]$required,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $updateSafeFileCategory = (Invoke-Expression "$pacli UPDATESAFEFILECATEGORY $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)") 2>&1
        
        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
    }
    
}