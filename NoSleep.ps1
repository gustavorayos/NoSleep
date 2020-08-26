<################################################################################>
<##                                                                            ##>
<##      NoSLEEP v20.4                                                         ##>
<##      Written by: Gustavo Rayos (www.gustavorayos.com)                      ##>
<##                                                                            ##>
<##      This script can be downloaded from                                    ##>
<##          https://www.gustavorayos.com/projects                             ##>
<##                                                                            ##>
<################################################################################>

Function centerText ($string1) {

    $width1 = $Host.UI.RawUI.WindowSize.Width - 4
    $blankSpaces = $width1/2 - $string1.length/2
    $writeBlanks = " " * $blankSpaces
    Write-Host $writeBlanks $string1 $writeBlanks

}

Function centerTextStars ($string2) {

    $width2 = $Host.UI.RawUI.WindowSize.Width - 4
    $stars = $width2/2 - $string2.length/2
    $writeStars = "*" * $stars
    Write-Host "$writeStars $string2 $writeStars*"

}

$noSleepVer = "v20.4"

$width = $Host.UI.RawUI.WindowSize.Width - 1
$widthHyphens = "-" * $width 
$widthStars = "*" * $width

Write-Host "`n$widthStars"
centerTextStars -string2 "WELCOME TO NoSLEEP"
Write-Host "$widthStars"

Write-Host "`n$widthHyphens"
centerText -string1 "Specify how many minutes you want to stay awake below."
centerText -string1 "`"0`" will keep NoSleep running forever."
centerText -string1 "Press `"Ctrl + C`" or the `"X`" button at any time to exit."
Write-Host "$widthHyphens`n"

While ($true) {
    $minutes = ""

    While ($minutes -eq "") {
        $minutes = Read-Host "How long do you want to stay awake? (minutes)"
        If ($minutes -match "^\d+$") {
            #Write-Host "number is good"
        }
        Else {
            Write-Host "The input you provided is not valid. Please try again."
            $minutes = ""
        }
    }

    $myshell = New-Object -com "Wscript.Shell"

    $i = 0

    Write-Host "`nNoSleep $noSleepVer by Gustavo Rayos..."
    Write-Host "`nBeginning NoSleep..."
    While ($i -lt $minutes -xor $minutes -eq 0) {
        If ($minutes -eq "0") {
            $minutes = -1
            $i = -2
            Write-Host "NoSleep will run until program is closed... (Ctrl + C)"
        }
        If ($minutes -gt "0") {
            $minutesRemaining = $minutes - $i
            If ($minutesRemaining -eq $minutes) {
                Write-Host "NoSleep will run for $minutes minutes..."
            }
            If ($minutesRemaining -eq 1) {
                Write-Host "Less than a minute remaining!"
            }
            If ($minutesRemaining -gt 1) {
                Write-Host "$minutesRemaining minutes remaining..."
            }
            $i++
        }
        Start-Sleep -Seconds 60
        $myshell.sendkeys("{NUMLOCK}{NUMLOCK}")
    }
    Write-Host "Time has expired, time to sleep. Thank you for using NoSleep!`n"
} #End of While true loop
