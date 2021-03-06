Function Add-Location{

    <#
    .SYNOPSIS
    	Adds a location to the Vault.

    .DESCRIPTION
    	Exposes the PACLI Function: "ADDLOCATION"

    .PARAMETER vault
        The name of the Vault to which the User has access.
    
    .PARAMETER user
        The Username of the User who is carrying out the command.
        
    .PARAMETER location
        The name of the location to add.
        Note: Add a backslash ‘\’ before the name of the location
        
    .PARAMETER quota
        The size of the quota to allocate to the location in MB. 
        The specification ‘-1’ indicates an unlimited quota allocation.

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
        [Parameter(Mandatory=$True)][string]$location,
        [Parameter(Mandatory=$False)][int]$quota,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                
        $addLocation = Invoke-Expression "$pacli ADDLOCATION $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)"
        
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