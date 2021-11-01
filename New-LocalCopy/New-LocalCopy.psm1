function New-LocalCopy([String]$Source,[PSCredential]$Credential){
  $tempdrive = [Guid]::NewGuid().Guid
  $newdriveargs = @{
      Name = $tempdrive
      PSProvider = "FileSystem"
      Root = split-path $Source
      Credential = $Credential
  }
  New-PSDrive @newdriveargs
  Copy-Item $Source
  Remove-PSDrive $tempdrive
}
Export-ModuleMember -Function New-LocalCopy