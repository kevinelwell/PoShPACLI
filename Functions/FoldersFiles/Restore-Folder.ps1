Function Restore-Folder{

    <#
    .SYNOPSIS
    	Undeletes a deleted folder in a Safe. A folder can only be undeleted if 
        the Safe History retention period has not expired for all activity in 
        the folder.

    .DESCRIPTION
    	Exposes the PACLI Function: "UNDELETEFOLDER"

    .PARAMETER vault
        The name of the Vault .

    .PARAMETER user
        The Username of the User who is carrying out the task.

    .PARAMETER safe
        The name of the Safe in which the folder will be undeleted.

    .PARAMETER folder
        The name of the folder to undelete.
        
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
        [Parameter(Mandatory=$True)][string]$safe,
        [Parameter(Mandatory=$True)][string]$folder,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $restoreFolder = (Invoke-Expression "$pacli UNDELETEFOLDER $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)") 2>&1
        
        if($LASTEXITCODE){
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $false
            
        }
        
        Else{
        
            Write-Debug "LastExitCode: $LASTEXITCODE"
            $true
            
        }
        
    }

}