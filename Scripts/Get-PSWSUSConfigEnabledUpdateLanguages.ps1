function Get-PSWSUSConfigEnabledUpdateLanguages {
<#
	.SYNOPSIS
		Gets the language codes that are enabled on the WSUS server.

	.DESCRIPTION
		The collection contains a snapshot of the languages that are enabled at this time.

	.EXAMPLE
		Get-PSWSUSConfigEnabledUpdateLanguages

	.OUTPUTS
		System.String

	.NOTES
		Name: Get-PSWSUSConfigEnabledUpdateLanguages
        Author: Dubinsky Evgeny
        DateCreated: 1DEC2013

	.LINK
		http://blog.itstuff.in.ua/?p=62#Get-PSWSUSConfigEnabledUpdateLanguages

	.LINK
		http://msdn.microsoft.com/en-us/library/windows/desktop/microsoft.updateservices.administration.iupdateserverconfiguration.getenabledupdatelanguages(v=vs.85).aspx
#>

    [CmdletBinding()]
    Param()

    Begin
    {
        if($wsus)
        {
            $config = $wsus.GetConfiguration()
            $config.ServerId = [System.Guid]::NewGuid()
            $config.Save()
        }#endif
        else
        {
            Write-Warning "Use Connect-PSWSUSServer for establish connection with your Windows Update Server"
            Break
        }
    }
    Process
    {
        Write-Verbose "Getting WSUS Enabled Update Languages."
        $config.GetEnabledUpdateLanguages()
    }
    End{}
}
