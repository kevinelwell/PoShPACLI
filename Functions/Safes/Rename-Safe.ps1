Function Rename-Safe{

    <#
    .SYNOPSIS
    	Renames a Safe

    .DESCRIPTION
    	Exposes the PACLI Function: "RENAMESAFE"

    .PARAMETER vault
        The name of the Vault containing the Safe
        
    .PARAMETER user
        The Username of the User carrying out the task
        
    .PARAMETER safe
        The current name of the Safe.
        
    .PARAMETER newName
        The new name of the Safe.
        
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
        [Alias("Name")][Parameter(Mandatory=$True)]$safe,
        [Parameter(Mandatory=$True)]$newName,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                        
        $renameSafe = (Invoke-Expression "$pacli UPDATESAFE $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString -quoteOutput)") 2>&1

        if($LASTEXITCODE){
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
        Else{
        
            write-debug "LastExitCode: $LASTEXITCODE"
            
        }
        
    }
    
}