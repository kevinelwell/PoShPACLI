Function Add-CTLCert{

    <#
    .SYNOPSIS
    	Adds a certificate to the Certificate Trust List store.

    .DESCRIPTION
    	Exposes the PACLI Function: "CTLADDCERT"

    .PARAMETER ctlFileName
    	The name of the CTL file to the CTL store. If this parameter is not
        supplied, the CTL file name that was supplied in the INIT function
        is used.

    .PARAMETER certFileName
        The full path and name of the certificate file.
        
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
        [Parameter(Mandatory=$False)][string]$ctlFileName,
        [Parameter(Mandatory=$False)][string]$certFileName,
        [Parameter(Mandatory=$False)][int]$sessionID
    )

    If(!(Test-ExePreReqs)){

            #$pacli variable not set or not a valid path

    }

    Else{

        #$PACLI variable set to executable path
                    
        $addCTLCert = Invoke-Expression "$pacli CTLADDCERT $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)"
        
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