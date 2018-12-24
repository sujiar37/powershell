#### Match making with the installed powershell version Vs latest one - Add this code under $profiles to notify when powershell cli opens #### 

function Get-Powershell_Release {
    $JSON = Invoke-WebRequest https://api.github.com/repos/PowerShell/PowerShell/releases/latest
    $Latestverion = ( $JSON.Content | ConvertFrom-Json )
    $progress = $ProgressPreference
    $ProgressPreference = "SilentlyContinue"
    
    if ( $PSVersionTable.GitCommitId )
      {
          if ( $Latestverion.tag_name -ne $PSVersionTable.GitCommitId )
          {
              write-output "New version of Powershell is available! - Version: $Latestverion.tag_name"
          }
          else 
          {
              Write-Output "Powershell is currently up to date"
          }
      }
    
      $ProgressPreference = $progress     
}

Get-Powershell_Release
