:: {bat.bat v11}      by frostium
:: -- version v11 [07.09.2024] --
:: (CHCP 65001 TR), (CHCP 1252 LT)

@echo off
setlocal EnableDelayedExpansion
net session >nul 2>&1
if '%errorlevel%' NEQ '0' (
    CLS
    color b
    echo {-----------------[ Yonetici yetkileri gerekli. Yeniden baslatiliyor... ]-----------------}
    timeout /t 0 /nobreak >nul
    powershell -Command "Start-Process cmd -ArgumentList '/c %~f0' -Verb RunAs"
    exit /b
    REM Adminstrator Conmfirmed.
)

::::::::::::::::::::::::::::::> Main Menu - bat.bat 
:menu
color 07
cls
title { bat.bat / Administrator } 
echo.  
echo  { #bat.bat /-----------------------------------------------} 
echo                  " bat.bat [ver11] - by f "
echo.
echo.  
echo                   /"Important Information"\
echo     [! - Do not touch cmd while process #1 is happening. ]
echo.  
echo   # Type the number you want!
echo.  
echo.  
echo   { Maintenance /------------------}
echo.  
echo    1} System Care
echo    2} Temporary Files
echo.  
echo   { Tools /------------------}
echo.  
echo    3} Updater 
echo    4} Windows Activation
echo    5} Bloatware Cleaner
echo    6} Security Wall Control
echo.  
echo   { Other /------------------}
echo.      
echo    7} After Reset
echo    8} Minecraft Server (Preview)
echo.
echo  { #Write Bellow /-----------------------------------------} 
echo.

set /p op="-> "
if %op%==1 goto bkm
if %op%==log goto log
if %op%==2 goto clean
if %op%==3 goto update
if %op%==4 goto lisans
if %op%==5 goto bloatware
if %op%==6 goto defwall
if %op%==7 goto startstp
if %op%==8 goto mcserver
if %op%==  goto error
goto error

::::::::::::::::::::::::::::::> Disk Error and Optimize - bat.bat
:dskchk
color a
cls
title { bat.bat / Disk Optimize} 
echo.
echo {--------------------------"1. Stage: (CHKDSK) Disk Hatalarini Bulma"--------------------------}
ping localhost -n 3 >nul
cd c:/
chkdsk /f
echo { Process Complated }
pause
goto menu

::::::::::::::::::::::::::::::> Temporary Files Clean - bat.bat 
:clean
color 0a
title { bat.bat / Temporary Files} 
cls
echo {-----------------------------"0/9 - 0. Stage: (Clean)"-----------------------------}

del /q /f /s "%USERPROFILE%\AppData\Local\Temp\*"
for /d %%p in ("%USERPROFILE%\AppData\Local\Temp\*") do @rd /s /q "%%p"

del /q /f /s "%SystemRoot%\Prefetch\*"
for /d %%p in ("%SystemRoot%\Prefetch\*") do @rd /s /q "%%p"

del /q /f /s "%SystemRoot%\Temp\*"
for /d %%p in ("%SystemRoot%\Temp\*") do @rd /s /q "%%p"

del /q /f /s "%SystemRoot%\SoftwareDistribution\Download\*"
for /d %%p in ("%SystemRoot%\SoftwareDistribution\Download\*") do @rd /s /q "%%p"

del /q /f /s "%USERPROFILE%\AppData\Local\D3DSCache\*"
for /d %%p in ("%USERPROFILE%\AppData\Local\D3DSCache\*") do @rd /s /q "%%p"

del /q /f /s "%USERPROFILE%\AppData\Local\cache\*"
for /d %%p in ("%USERPROFILE%\AppData\Local\cache\*") do @rd /s /q "%%p"

del /q /f /s "%ProgramData%\PackageCache\*"
for /d %%p in ("%ProgramData%\PackageCache\*") do @rd /s /q "%%p"

del /q /f /s "%USERPROFILE%\AppData\Local\NVIDIA\GLCache\*"
for /d %%p in ("%USERPROFILE%\AppData\Local\NVIDIA\GLCache\*") do @rd /s /q "%%p"

del /q /f /s "%USERPROFILE%\AppData\Local\NVIDIA\DXCache\*"
for /d %%p in ("%USERPROFILE%\AppData\Local\NVIDIA\DXCache\*") do @rd /s /q "%%p"

del /q /f /s "%USERPROFILE%\AppData\Roaming\NVIDIA\ComputeCache\*"
for /d %%p in ("%USERPROFILE%\AppData\Roaming\NVIDIA\ComputeCache\*") do @rd /s /q "%%p"

powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; $result = [System.Windows.Forms.MessageBox]::Show('Disk Temizlemeyi (CleanMGR) Acmak Ister Misiniz?' + [System.Environment]::NewLine + [System.Environment]::NewLine + '- Geri donusum kutusunu bosaltmayi unutma :)', 'Uyari', 'YesNo', 'Question'); if ($result -eq 'Yes') { exit 0 } else { exit 1 }"

if %errorlevel%==0 (
    echo Process Continued..
    start Cleanmgr
    goto menu
) else (
    echo Returning To Menu...
    goto menu
)


::::::::::::::::::::::::::::::> Windows Repair - bat.bat 
:bkm
color 07
cls
title { bat.bat / Windows Repair (Take Time) } 

powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; $result = [System.Windows.Forms.MessageBox]::Show('Disk Onariciyi (dfrgui.exe) Acmak Ister Misiniz? (Acilmasi Onerilir!)' + [System.Environment]::NewLine + [System.Environment]::NewLine + 'Onemli Uyari: Bakim islemi yapilirken CMDye dokunmayin. Islem bitene kadar pencereyi (-) ile arkaya alabilirsiniz. Eger pencerenin aciklamasinda "Sec" yaziyorsa pencereyi acip ENTER tusuna basarak Sec yazisinin gittiginden emin olun. Aksi taktirde CMD secim moduna girdigi icin bakim kodlari calismayacaktir.' + [System.Environment]::NewLine +  [System.Environment]::NewLine + 'Ek Not: Bakim islemleri bittiginde Microsoft Store acilmasi normaldir. WSReset.exe koduyla hatalari onler ve indirme onbellegini yeniler.', 'Uyari', 'YesNo', 'Question'); if ($result -eq 'Yes') { exit 0 } else { exit 1 }"

if %errorlevel%==0 (
    start "" "%windir%\system32\dfrgui.exe"
    goto bkmgo
) else (
    echo System Care is Starting...
    goto bkmgo
)

:bkmgo
color 07
cls
title { bat.bat / Windows Repair (Take Time) } 
echo Repairing Started...
echo {--------------------------"Stage 1: (SCANNOW) SFC"--------------------------}
SFC /SCANNOW
echo.
echo {-----------------------"Stage 2: (ScanHealth) DISM.exe"-----------------------}
DISM.exe /Online /Cleanup-image /Scanhealth
echo.
echo {---------------------"Stage 3: (RestoreHealth) DISM.exe"---------------------}
DISM.exe /Online /Cleanup-image /Restorehealth
echo.
echo {-----------------"Stage 4: (AnalyzeComponentStore) DISM.exe"-----------------}
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
echo.
echo {-----------------"Stage 5: (StartComponentCleanup) DISM.exe"-----------------}
Dism.exe /Online /Cleanup-Image /StartComponentCleanup
echo.
echo {-----------"Stage 6: (StartComponentCleanup + ResetBase) DISM.exe"-----------}
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
echo.
echo {------------------"Stage 7: (RestoreHealth(DISM)) DISM.exe"------------------}
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo {-----------"Stage 8: (RepairSource\Windows + LimitAccess) DISM.exe"-----------}
DISM.exe /Online /Cleanup-Image /RestoreHealth /Source:C:\RepairSource\Windows /LimitAccess
echo.
echo {-----------------------"Stage 9: (ipconfig) \flushdns"-----------------------}
ipconfig /flushdns
echo.
echo {----------------"Stage 10: (Windows Store Reset) WSReset.exe"----------------}
start "" "WSReset.exe"
echo. 
echo { Process Complated }
pause
goto menu

::::::::::::::::::::::::::::::> Repair Logs - bat.bat
:log
cls
title title { bat.bat / Windows Repair (Logs) } 
start C:\Windows\Logs
cls
goto menu


::::::::::::::::::::::::::::::> Bloatware Cleaner - bat.bat 
:bloatware
color 1f
cls
title { bat.bat / Bloatware 
echo    { Bloatware Cleaner /-----------}

@rem *** Disable Some Service ***
sc stop DiagTrack
sc stop diagnosticshub.standardcollector.service
sc stop dmwappushservice
sc stop WMPNetworkSvc
sc stop WSearch

sc config DiagTrack start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config dmwappushservice start= disabled
REM sc config RemoteRegistry start= disabled
REM sc config TrkWks start= disabled
sc config WMPNetworkSvc start= disabled
sc config WSearch start= disabled
REM sc config SysMain start= disabled

REM *** SCHEDULED TASKS tweaks ***
REM schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyUpload" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable
schtasks /Change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /Disable

REM schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
REM schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
REM schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
REM schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable *** Not sure if should be disabled, maybe related to S.M.A.R.T.
REM schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
REM schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
REM schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
REM schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
REM The stubborn task Microsoft\Windows\SettingSync\BackgroundUploadTask can be Disabled using a simple bit change. I use a REG file for that (attached to this post).
REM schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
REM schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
REM schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
REM schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable

@rem *** Remove Telemetry & Data Collection ***
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f

@REM Settings -> Privacy -> General -> Let apps use my advertising ID...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
REM - SmartScreen Filter for Store Apps: Disable
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
REM - Let websites provide locally...
reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f

@REM WiFi Sense: HotSpot Sharing: Disable
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v value /t REG_DWORD /d 0 /f
@REM WiFi Sense: Shared HotSpot Auto-Connect: Disable
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v value /t REG_DWORD /d 0 /f

@REM Change Windows Updates to "Notify to schedule restart"
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v UxOption /t REG_DWORD /d 1 /f
@REM Disable P2P Update downlods outside of local network
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f

REM *** Hide the search box from taskbar. You can still search by pressing the Win key and start typing what you're looking for ***
REM 0 = hide completely, 1 = show only icon, 2 = show long search box
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f

REM *** Disable MRU lists (jump lists) of XAML apps in Start Menu ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f

REM *** Set Windows Explorer to start on This PC instead of Quick Access ***
REM 1 = This PC, 2 = Quick access
REM reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f

@rem Remove Apps
PowerShell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsCamera* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
rem PowerShell -Command "Get-AppxPackage *photos* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *solit* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
rem PowerShell -Command "Get-AppxPackage *zune* | Remove-AppxPackage"
REM PowerShell -Command "Get-AppxPackage *WindowsCalculator* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Sway* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *CommsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Drawboard PDF* | Remove-AppxPackage"

@rem NOW JUST SOME TWEAKS
REM *** Show hidden files in Explorer ***
REM reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f

REM *** Show super hidden system files in Explorer ***
REM reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 1 /f

REM *** Show file extensions in Explorer ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t  REG_DWORD /d 0 /f

REM *** Uninstall OneDrive ***
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
rd C:\OneDriveTemp /Q /S >NUL 2>&1
rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
echo OneDrive has been removed. Windows Explorer needs to be restarted.
start /wait TASKKILL /F /IM explorer.exe
start explorer.exe
echo { Process Complated }
pause
goto menu

::::::::::::::::::::::::::::::> Activation Main Menu - bat.bat 
:lisans
color 1f
cls
title { bat.bat / Windows Activation} 
echo    { Windows Activation /-----------}
echo.
echo     # Choose version!
echo.
echo     { Version /-----------}
echo      1} Windows 11
echo      2} Windows 10
echo      3} Windows 8.1
echo     {---------------------}
echo      x} Main Menu
echo.

set /p op=">> "
if %op%==1 goto w11
if %op%==2 goto w10
if %op%==3 goto w81
if %op%==4 goto w8
if %op%==x goto menu
goto error

::::::::::::::::::::::::::::::> Activation (Windows 11) - bat.bat 
:w11
color 1
cls
ping localhost -n 3 >nul
title { bat.bat / Windows Activation (Win 11) } 
echo.
echo  { Windows 11 /------------------------}
echo.
echo   # Choose Windows 11 Activation Package!
echo.
echo    1}- Windows 11 Home
echo    2}- Windows 11 Home Single Language
echo    3}- Windows 11 Pro
echo.
echo  {--------------------------------------}
echo    x} Main Menu

set /p op=">> "
if %op%==1 goto w11h
if %op%==2 goto w11hsl
if %op%==3 goto w11p
if %op%==x goto menu
goto error

::____________________________________________
:w11h
color 1
cls
title { bat.bat / Windows Activation (Win 11 - Home) }
slmgr /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
slmgr /skms kms8.msguides.com
pause
slmgr /ato
ping localhost -n 3 >nul
goto menu

::____________________________________________
:w11hsl
color 1
cls
title { bat.bat / Windows Activation (Win 11 - Home Single Language) }
slmgr /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
slmgr /skms kms8.msguides.com
pause
slmgr /ato
ping localhost -n 3 >nul
goto menu

::____________________________________________
:w11p
color 1
cls
title { bat.bat / Windows Activation (Win 11 - Pro) }
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms8.msguides.com
pause
slmgr /ato
ping localhost -n 3 >nul
goto menu

::::::::::::::::::::::::::::::> Activation (Windows 10) - bat.bat 
:w10
color 1
cls
ping localhost -n 3 >nul
title { bat.bat / Windows Activation (Win 10) }
echo.
echo  { Windows 10 /-------------------------}
echo.
echo   # Choose Windows 10 Activation Package!
echo.
echo    1}- Windows 10 Home
echo    2}- Windows 10 Home Single Language
echo    3}- Windows 10 Pro
echo.
echo  {--------------------------------------}
echo    x} Main Menu

set /p op=">> "
if %op%==1 goto w10h
if %op%==2 goto w10hsl
if %op%==3 goto w10p
if %op%==x goto menu
goto error

::____________________________________________
:w10h
color 1
cls
title { bat.bat / Windows Activation (Win 10 - Home) }
slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
slmgr /skms kms8.msguides.com
pause
slmgr /ato
ping localhost -n 3 >nul
goto menu

::____________________________________________
:w10hsl
color 1
cls
title { bat.bat / Windows Activation (Win 10 - Home Single Language) }
slmgr /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
slmgr /skms kms8.msguides.com
pause
slmgr /ato
ping localhost -n 3 >nul
goto menu

::____________________________________________
:w10p
color 1
cls
title { bat.bat / Windows Activation (Win 10 - Pro) }
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms8.msguides.com
pause
slmgr /ato
ping localhost -n 3 >nul
goto menu

::::::::::::::::::::::::::::::> Activation (Windows 8.1) - bat.bat 
:w81
color 1
cls
ping localhost -n 3 >nul
title { bat.bat / Windows Activation (Win 8.1) }
echo.
echo  { Windows 8.1 /-------------------------}
echo.
echo   # Choose Windows 8.1 Activation Package!
echo.
echo    1}- Windows 8.1 Home
echo    2}- Windows 8.1 Home Single Language
echo    3}- Windows 8.1 Pro
echo.
echo  {---------------------------------------}
echo    x} Main Menu

set /p op=">> "
if %op%==1 goto w81h
if %op%==2 goto w81hsl
if %op%==3 goto w81p
if %op%==x goto menu
goto error

::____________________________________________
:w81h
color 1
cls
title { bat.bat / Windows Activation (Win 8.1 - Home) }
slmgr /ipk M9Q9P-WNJJT-6PXPY-DWX8H-6XWKK
slmgr /skms kms8.msguides.com
pause
slmgr /ato
ping localhost -n 3 >nul
goto menu

::____________________________________________
:w81hsl
color 1
cls
title { bat.bat / Windows Activation (Win 8.1 - Home Single Language) }
slmgr /ipk BB6NG-PQ82V-VRDPW-8XVD2-V8P66
slmgr /skms kms8.msguides.com
pause
slmgr /ato
ping localhost -n 3 >nul
goto menu

::____________________________________________
:w81p
color 1
cls
title { bat.bat / Windows Activation (Win 8.1 - Pro) }
slmgr /ipk GCRJD-8NW9H-F2CDX-CCM8D-9D6T9
slmgr /skms kms8.msguides.com
pause
slmgr /ato
ping localhost -n 3 >nul
goto menu

::::::::::::::::::::::::::::::> Update - bat.bat 
@echo on
:update
color f
cls
title { bat.bat / Update }
echo _____________________________________________________________________________________
echo It is completely automatic. Just Wait!
winget upgrade --all --accept-package-agreements --accept-source-agreements
winget upgrade --all --accept-package-agreements --accept-source-agreements
echo { Process Complated }
pause
goto menu

::::::::::::::::::::::::::::::> After Reset - bat.bat 
:startstp
color 08
title { bat.bat / After Reset Setup }
cls
echo      { Directive /----------------------------------------}
echo.
echo         REG.
echo            - HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders  
echo            - HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device
echo                  New Key - Education - DWORD (32-bit) - EnableEduThemes - Value 1
echo.
echo      {----------------------------------------------------}
echo.
echo         # Choose Someone!
echo.
echo         { Options /-----------}
echo.
echo          1} Driver;
echo             -// Nvidia GeForce Experience, SteelSeries GG, Msi Control Center
echo                 Msi Afterburner, VcRedist, DirectX, JRE, JDK //-
echo.
echo          2} Application;
echo             -// Spotify, Discord, Whatsapp, Instagram, Steam, WinRAR
echo                 PowerToys, Dev Home, EarTrumpet, OBS Studio, CapCut
echo                 TranslucenTB, Lively Wallpaper //-
echo.   
echo          3} Addtions
echo.
echo         {----------------------------------------------------}
echo          x} Main Menu
echo.                     

set /p op=">> "
if %op%==1 goto DriverSetup
if %op%==2 goto Programlar
if %op%==3 goto Ekler
if %op%==4 goto Tool
if %op%==5 goto Plug-in
if %op%==6 goto iso
if %op%==x goto menu
goto error

::____________________________________________
:DriverSetup
title { bat.bat / Driver Setup }
cls
echo          {-------------for/frostium-------------}
echo.
echo            # Choose Someone!
echo.
echo             { Options /-----------}
echo.
echo              1} Nvidia; (GeForce Experience)
echo              2} Main Driver; (VcRedist, DirectX, JRE, JDK)
echo              3} Equipment Driver (SteelSeries GG, Msi Control Center)
echo.                     
echo             {----------------------------------------------------------}
echo              x} Main Menu
echo.

set /p op=">> "
if %op%==1 goto DriverNvidia
if %op%==2 goto DriverMain
if %op%==3 goto DriverEquipment
if %op%==x goto menu
goto error

::____________________________________________
:DriverNvidia
title { bat.bat / Driver (Nvidia) }
cls
winget install --id=Nvidia.GeForceExperience -e
pause
goto DriverSetup

::____________________________________________
:DriverMain
title { bat.bat / Driver (Main) }
cls

    winget install --id=Oracle.JavaRuntimeEnvironment -e
    winget install --id=Microsoft.DirectX -e
    winget install --id=Microsoft.VCRedist.2015+.x86 -e
    winget install --id=Microsoft.VCRedist.2015+.x64 -e
    ::winget install --id=Microsoft.VCRedist.2013.x86 -e
    ::winget install --id=Microsoft.VCRedist.2013.x64 -e
    ::winget install --id=Microsoft.VCRedist.2012.x86 -e
    ::winget install --id=Microsoft.VCRedist.2012.x64 -e
    ::winget install --id=Microsoft.VCRedist.2010.x86 -e
    ::winget install --id=Microsoft.VCRedist.2010.x64 -e
    ::winget install --id=Microsoft.VCRedist.2008.x86 -e
    ::winget install --id=Microsoft.VCRedist.2008.x64 -e
    ::winget install --id=Microsoft.VCRedist.2005.x86 -e
    ::winget install --id=Microsoft.VCRedist.2005.x64 -e
    ::winget install --id=Oracle.JDK.17 -e
    ::winget install --id=Oracle.JDK.18 -e
    winget install --id=Oracle.JDK.21 -e

pause
goto DriverSetup

::____________________________________________
:DriverEquipment
title { bat.bat / Driver (Equipment) }
cls

    winget install --id=SteelSeries.GG -e
    winget install "9NVMNJCR03XV" -s msstore --accept-package-agreements

pause
goto DriverSetup

::____________________________________________
:Programlar 
cls
    winget install "9NCBCSZSJRSB" -s msstore --accept-package-agreements 
    :: Spotify

    winget install "XPDC2RH70K22MN" -s msstore --accept-package-agreements 
    :: Discord

    winget install "9NKSQGP7F2NH" -s msstore --accept-package-agreements 
    :: WhatsApp

    ::winget install "9NBLGGH5L9XT" -s msstore --accept-package-agreements 
    :: Instagram

    winget install "XP89DCGQ3K6VLD" -s msstore --accept-package-agreements 
    :: PowerToys

    ::winget install "9NBLGGH4Z1JC" -s msstore --accept-package-agreements 
    :: Speed by Ookla

    ::winget install "9NBLGGH516XP" -s msstore --accept-package-agreements 
    :: EarTrumpet

    winget install "XP9KN75RRB9NHS" -s msstore --accept-package-agreements 
    :: CapCut

    ::winget install "9NTM2QC6QWS7" -s msstore --accept-package-agreements 
    :: Lively Wallpaper

    ::winget install "9PF4KZ2VN4W9" -s msstore --accept-package-agreements 
    :: TranslucenTB

    ::winget install "9N8MHTPHNGVV" -s msstore --accept-package-agreements 
    :: Dev Home

    winget install "XPFFH613W8V6LV" -s msstore --accept-package-agreements 
    :: OBS Studio

    ::winget install "9N9KDPHV91JT" -s msstore --accept-package-agreements 
    :: f.lux

    ::winget install --id=Radmin.VPN -e
    ::RadminVPN

    winget install --id=RARLab.WinRAR -e
    ::WinRAR

    ::-winget install --id=Oracle.VirtualBox -e
    ::VirtualBox

    winget install --id=Valve.Steam -e
    ::Steam

    ::winget install --id=Nilesoft.Shell -e
    ::Nilesoft Shell

    ::winget install "9N8GNLC8Z9C8" -s msstore --accept-package-agreements
    ::Defender App Guard

    ::-winget install --id=Figma.Figma -e
    ::Figma

    ::-winget install "9NBLGGH4TLCQ" -s msstore --accept-package-agreements
    ::Windows Community Toolkit Gallery

    ::-winget install "9P3JFPWWDZRC" -s msstore --accept-package-agreements
    ::WinUI 3 Gallery

    ::winget install "9PLJWWSV01LK" -s msstore --accept-package-agreements
    :: Twinkle Tray

    ::winget install "9P8LTPGCBZXD" -s msstore --accept-package-agreements
    :: WinToys
    
    ::winget install "9PM860492SZD" -s msstore --accept-package-agreements
    :: Pc Manager (Microsoft)
pause
goto DriverSetup

::____________________________________________
:Ekler
    start "" "https://fabi.me/en/tools/speed-autoclicker/"
    start "" "https://www.blockbench.net/"
    start "" "https://www.curseforge.com/download/app"
    start "" "https://www.bcuninstaller.com/"
    start "" "https://winaero.com/download-universal-watermark-disabler/"
    start "" "https://www.gezginler.net/indir/unlocker.html"
    start "" "https://www.majorgeeks.com/files/details/take_full_ownership_of_files_folders_registry_hack.html"
    start "" ""
goto startstp

::::::::::::::::::::::::::::::> Windows Security Wall - bat.bat 
:defwall
color f
cls
title { bat.bat / Windows Security Wall Control }
echo.
echo  {--------------Win Sec Wall--------------}
echo.
echo  # Windows Security Wall Control
echo.
echo  1}- [Open] Windows Defender Security Wall 
echo  2}- [Close] Windows Defender Security Wall 
echo  {---------------------------}
echo  x} Main Menu
echo.
echo.

set /p op=">> "
if %op%==1 goto defwallon
if %op%==2 goto defwalloff
if %op%==x goto menu

::____________________________________________
:defwallon
color a
cls
title { bat.bat / Windows Security Wall Control (Off) }
ping localhost -n 3 >nul
NetSh Advfirewall set allprofiles state off
echo __________________________________________________________
echo * Press Enter To Return Main Menu
pause
goto menu

::____________________________________________
:defwalloff
color 4
cls
title { bat.bat / Windows Security Wall Control (On) }
ping localhost -n 3 >nul
NetSh Advfirewall set allprofiles state on
echo __________________________________________________________
echo * Press Enter To Return Main Menu
pause
goto menu

::::::::::::::::::::::::::::::> SysInf - bat.bat 
:sysinf
color 4f
cls
title { bat.bat / System Imformation }
systeminfo
pause
goto menu

::::::::::::::::::::::::::::::> Minecraft Server - bat.bat 
:mcserver
cls
title { bat.bat / Minecraft Server }
echo  { #bat.bat /----------Minecraft Server---------} 
echo.
echo        / Recomended Launcher - SKlauncher \
echo.
echo  # Select 
echo.
echo  1} [Vanilla] Default Pack
echo  2} [Plugin] CraftBukkit, SpigotBukkit
echo  3} [Mod] Forge, Fabric (Beta)
echo.
echo  {-------------------Required-------------------}
echo.
echo  4} Install All Required Softwares
echo    [Java][JDK22][JDK21][RadminVPN]
echo.
echo  {----------------------------------------------}
echo  x} Main Menu
echo.
set /p op=">> "
if %op%==1 goto mcvanilla
if %op%==2 goto mcplugin
if %op%==3 goto mcmod
if %op%==4 goto mcrequired
if %op%==x goto menu

::____________________________________________
:mcvanilla
cls
title { bat.bat / Minecraft Server }
echo  {----------Minecraft Server---------} 
echo.
echo  # Select Type
echo.
echo  1} [Relase] See Full Ver.
echo  2} [Snapshot] See Prewiev Ver.
echo  3} [All Version] See All Ver.
echo.
echo  {-----------------------------------}
echo  x} Main Menu
echo.

set /p op=">> "
if %op%==1 goto mcrelase
if %op%==2 goto mcsnapshot
if %op%==3 goto mcallver
if %op%==x goto menu

::::::::::::::::::::::::::::::> Minecraft Server (Release) - bat.bat
:mcrelase
cls
title { bat.bat / Minecraft Release }
echo {---------Minecraft Vanilla Release---------} 
powershell -command "(New-Object Net.WebClient).DownloadFile('https://launchermeta.mojang.com/mc/game/version_manifest.json', 'version_manifest.json')"
powershell -command "$versions = (Get-Content 'version_manifest.json' | ConvertFrom-Json).versions | where { $_.type -eq 'release' } | select -ExpandProperty id; $i=1; foreach ($version in $versions) { Write-Host $i. $version; $i++ }"
echo {-----------------Swipe Up------------------}
echo x} Main Menu
echo.
set /p version=Write Server Version: 
if %version%==x goto menu
cls
echo { Selected Version %version% Downloading}
mkdir %userprofile%\Desktop\Sunucu_%version%

:: Launchermeta dosyasından sürüm URL'sini al
powershell -command "(New-Object Net.WebClient).DownloadFile('https://launchermeta.mojang.com/mc/game/version_manifest.json', 'version_manifest.json')"

:: Sürüm URL'sini içeren JSON dosyasını oku
for /f %%i in ('powershell -command "(Get-Content version_manifest.json | ConvertFrom-Json).versions | where { $_.id -eq '%version%' } | select -ExpandProperty url"') do set version_url=%%i

:: Sürüm URL'sindeki JSON dosyasını indir
powershell -command "(New-Object Net.WebClient).DownloadFile('%version_url%', 'server.json')"

:: İndirilen JSON dosyasından indirme bağlantısını al ve sunucu jar dosyasını indir
for /f %%i in ('powershell -command "(Get-Content server.json | ConvertFrom-Json).downloads.server.url"') do set download_url=%%i
cd %userprofile%\Desktop\Sunucu_%version%
powershell -command "(New-Object Net.WebClient).DownloadFile('%download_url%', 'server.jar')"

set "filename=run.bat"
echo @echo off > %filename%
echo java -Xmx4G -Xms1G -jar server.jar nogui >> %filename%

cd %userprofile%\Desktop
del version_manifest.json
del server.json
echo ! Ignore the above.

msg * "Sunucuyu klasorde bulunan run.bat ile acin. Ram degeri otomatik olarak 4G olarak ayarlanmistir. Run.bat dosyasini duzenleyip Xmx degerine istediginiz ram degerini girin. Kurulum bilgileri icin sunucu klasorundeki okubeni.txt dosyasini inceleyin."
powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; $result = [System.Windows.Forms.MessageBox]::Show('Sunucu Basariyla Masaustune Kuruldu. Sunucuyu baslatmak ister misiniz ?', 'Uyari', 'YesNo', 'Question'); if ($result -eq 'Yes') { exit 0 } else { exit 1 }"

if %errorlevel%==0 (
    echo Server Starting...
    cd %userprofile%\Desktop\Sunucu_%version%
    goto mceulaop

) else (
    echo Returning To Menu...
    goto mceula
)
goto mcserver

::::::::::::::::::::::::::::::> Minecraft Server Vanilla (Snapshot) - bat.bat
:mcsnapshot
cls
title { bat.bat / Minecraft Snapshot }
echo {---------Minecraft Vanilla Snapshot---------} 
powershell -command "(New-Object Net.WebClient).DownloadFile('https://launchermeta.mojang.com/mc/game/version_manifest.json', 'version_manifest.json')"
powershell -command "$versions = (Get-Content 'version_manifest.json' | ConvertFrom-Json).versions | where { $_.type -eq 'snapshot' } | select -ExpandProperty id; $i=1; foreach ($version in $versions) { Write-Host $i. $version; $i++ }"
echo {-----------------Swipe Up-------------------}
echo x} Main Menu
echo.
set /p version=Write Server Version: 
if %version%==x goto menu
cls
echo { Selected Version %version% Downloading}
mkdir %userprofile%\Desktop\Sunucu_%version%

:: Launchermeta dosyasından sürüm URL'sini al
powershell -command "(New-Object Net.WebClient).DownloadFile('https://launchermeta.mojang.com/mc/game/version_manifest.json', 'version_manifest.json')"

:: Sürüm URL'sini içeren JSON dosyasını oku
for /f %%i in ('powershell -command "(Get-Content version_manifest.json | ConvertFrom-Json).versions | where { $_.id -eq '%version%' } | select -ExpandProperty url"') do set version_url=%%i

:: Sürüm URL'sindeki JSON dosyasını indir
powershell -command "(New-Object Net.WebClient).DownloadFile('%version_url%', 'server.json')"

:: İndirilen JSON dosyasından indirme bağlantısını al ve sunucu jar dosyasını indir
for /f %%i in ('powershell -command "(Get-Content server.json | ConvertFrom-Json).downloads.server.url"') do set download_url=%%i
cd %userprofile%\Desktop\Sunucu_%version%
powershell -command "(New-Object Net.WebClient).DownloadFile('%download_url%', 'server.jar')"

set "filename=run.bat"
echo @echo off > %filename%
echo java -Xmx4G -Xms1G -jar server.jar nogui >> %filename%

cd %userprofile%\Desktop
del version_manifest.json
del server.json
echo ! Ignore the above.

msg * "Sunucuyu klasorde bulunan run.bat ile acin. Ram degeri otomatik olarak 4G olarak ayarlanmistir. Run.bat dosyasini duzenleyip Xmx degerine istediginiz ram degerini girin. Kurulum bilgileri icin sunucu klasorundeki okubeni.txt dosyasini inceleyin."
powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; $result = [System.Windows.Forms.MessageBox]::Show('Sunucu Basariyla Masaustune Kuruldu. Sunucuyu baslatmak ister misiniz ?', 'Uyari', 'YesNo', 'Question'); if ($result -eq 'Yes') { exit 0 } else { exit 1 }"

if %errorlevel%==0 (
    echo Server Starting...
    cd %userprofile%\Desktop\Sunucu_%version%
    goto mceulaop

) else (
    echo Returning To Menu...
    goto mceula
)
goto mcserver

::::::::::::::::::::::::::::::> Minecraft Server Vanilla (All Version) - bat.bat
:mcallver
cls
title { bat.bat / Minecraft All Version }
echo {---------Minecraft Vanilla All Version---------}
powershell -command "(New-Object Net.WebClient).DownloadFile('https://launchermeta.mojang.com/mc/game/version_manifest.json', 'version_manifest.json')"
powershell -command "$versions = (Get-Content 'version_manifest.json' | ConvertFrom-Json).versions | select -ExpandProperty id; $i=1; foreach ($version in $versions) { Write-Host $i. $version; $i++ }"
echo {-------------------Swipe Up--------------------}
echo x} Main Menu
echo.
set /p version=Write Server Version: 
if %version%==x goto menu
cls
echo { Selected Version %version% Downloading}
mkdir %userprofile%\Desktop\Sunucu_%version%

:: Launchermeta dosyasından sürüm URL'sini al
powershell -command "(New-Object Net.WebClient).DownloadFile('https://launchermeta.mojang.com/mc/game/version_manifest.json', 'version_manifest.json')"

:: Sürüm URL'sini içeren JSON dosyasını oku
for /f %%i in ('powershell -command "(Get-Content version_manifest.json | ConvertFrom-Json).versions | where { $_.id -eq '%version%' } | select -ExpandProperty url"') do set version_url=%%i

:: Sürüm URL'sindeki JSON dosyasını indir
powershell -command "(New-Object Net.WebClient).DownloadFile('%version_url%', 'server.json')"

:: İndirilen JSON dosyasından indirme bağlantısını al ve sunucu jar dosyasını indir
for /f %%i in ('powershell -command "(Get-Content server.json | ConvertFrom-Json).downloads.server.url"') do set download_url=%%i
cd %userprofile%\Desktop\Sunucu_%version%
powershell -command "(New-Object Net.WebClient).DownloadFile('%download_url%', 'server.jar')"

set "filename=run.bat"
echo @echo off > %filename%
echo java -Xmx4G -Xms1G -jar server.jar nogui >> %filename%

cd %userprofile%\Desktop
del version_manifest.json
del server.json
echo ! Ignore the above.

msg * "Sunucuyu klasorde bulunan run.bat ile acin. Ram degeri otomatik olarak 4G olarak ayarlanmistir. Run.bat dosyasini duzenleyip Xmx degerine istediginiz ram degerini girin. Kurulum bilgileri icin sunucu klasorundeki okubeni.txt dosyasini inceleyin."
powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; $result = [System.Windows.Forms.MessageBox]::Show('Sunucu Basariyla Masaustune Kuruldu. Sunucuyu baslatmak ister misiniz ?', 'Uyari', 'YesNo', 'Question'); if ($result -eq 'Yes') { exit 0 } else { exit 1 }"

if %errorlevel%==0 (
    echo Server Starting...
    cd %userprofile%\Desktop\Sunucu_%version%
    goto mceulaop

) else (
    echo Returning To Menu...
    goto mceula
)
goto mcserver

::::::::::::::::::::::::::::::> Minecraft Server Plugin - bat.bat
@echo off
:mcplugin
msg * "Modlu sunucu kurmadan once kuracaginiz modlarin sunucunuz ile uyumlu olmasina (surum, modloader, ek materyal vb.) dikkat edin. Ugrasmamak icin mumkunse CurseForge uzerinden begendiginiz ModPack ve ModPack server dosyalarini indirin."
cls
title { bat.bat / Minecraft Plugin Server }
echo {---------Minecraft Plugin Server---------}
echo  x} Main Menu
echo.
set /p serverType=Which server type would you like to download? (Spigot/Bukkit): 

if %serverType%==x goto menu

if /I "%serverType%"=="Spigot" (
    goto :GET_SPIGOT_VERSION
) else if /I "%serverType%"=="Bukkit" (
    goto :GET_BUKKIT_VERSION
) else (
    echo You entered an invalid server type. Please specify 'Spigot' or 'Bukkit'.
    goto :mcplugin
)

::::::::::::::::::::::::::::::> Minecraft Server SpigotBukkit - bat.bat
:GET_SPIGOT_VERSION
set /p spigotVersion=Enter Spigot server version: 
set "desktop=%USERPROFILE%\Desktop"
set "folder=%desktop%\Spigot_%spigotVersion%_Sunucu"
mkdir "%folder%"
echo The server file is being downloaded, please wait...
title { bat.bat / Spigot Server Downloading... }
bitsadmin /transfer "SpigotDownload" https://download.getbukkit.org/spigot/spigot-%spigotVersion%.jar "%folder%\server.jar"
bitsadmin /transfer "SpigotDownload" https://cdn.getbukkit.org/spigot/spigot-%spigotVersion%.jar "%folder%\server.jar"

set "filename=run.bat"
echo @echo off > %filename%
echo java -Xmx4G -Xms1G -jar server.jar nogui >> %filename%

cls
echo Spigot server file downloaded successfully.

msg * "Sunucuyu klasorde bulunan run.bat ile acin. Ram degeri otomatik olarak 4G olarak ayarlanmistir. Run.bat dosyasini duzenleyip Xmx degerine istediginiz ram degerini girin. Kurulum bilgileri icin sunucu klasorundeki okubeni.txt dosyasini inceleyin."
powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; $result = [System.Windows.Forms.MessageBox]::Show('Sunucu Basariyla Masaustune Kuruldu. Sunucuyu baslatmak ister misiniz ?', 'Uyari', 'YesNo', 'Question'); if ($result -eq 'Yes') { exit 0 } else { exit 1 }"

if %errorlevel%==0 (
    echo Server Starting...
    msg * "Actiginiz sunucu pluginleri desteklemektedir. Sunucunun surumune gore dev.bukkit.org/bukkit-plugins sitesinden pluginleri indirip sunucu klasorundeki plugins klasorune atin. Pluginleri oyundayken eklemek isterseniz /reload yazin. OP gerekli."
    cd %userprofile%\Desktop\Spigot_%spigotVersion%_Sunucu
    goto mceulaop

) else (
    echo Returning To Menu...
    goto mceula
)
goto mcserver

::::::::::::::::::::::::::::::> Minecraft Server CraftBukkit - bat.bat
:GET_BUKKIT_VERSION
set /p bukkitVersion=Enter Bukkit server version: 
set "desktop=%USERPROFILE%\Desktop"
set "folder=%desktop%\Bukkit_%bukkitVersion%_Sunucu"
mkdir "%folder%"
echo The server file is being downloaded, please wait...
title { bat.bat / Bukkit Server Downloading... }
bitsadmin /transfer "BukkitDownload" https://download.getbukkit.org/craftbukkit/craftbukkit-%bukkitVersion%.jar "%folder%\server.jar"
bitsadmin /transfer "BukkitDownload" https://cdn.getbukkit.org/craftbukkit/craftbukkit-%bukkitVersion%.jar "%folder%\server.jar"
cd %folder%
set "filename=run.bat"
echo @echo off > %filename%
echo java -Xmx4G -Xms1G -jar server.jar nogui >> %filename%

cls
echo Bukkit server file downloaded successfully.

msg * "Sunucuyu klasorde bulunan run.bat ile acin. Ram degeri otomatik olarak 4G olarak ayarlanmistir. Run.bat dosyasini duzenleyip Xmx degerine istediginiz ram degerini girin. Kurulum bilgileri icin sunucu klasorundeki okubeni.txt dosyasini inceleyin."
powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; $result = [System.Windows.Forms.MessageBox]::Show('Sunucu Basariyla Masaustune Kuruldu. Sunucuyu baslatmak ister misiniz ?', 'Uyari', 'YesNo', 'Question'); if ($result -eq 'Yes') { exit 0 } else { exit 1 }"

if %errorlevel%==0 (
    echo Server Starting...
    msg * "Actiginiz sunucu pluginleri desteklemektedir. Sunucunun surumune gore dev.bukkit.org/bukkit-plugins sitesinden pluginleri indirip sunucu klasorundeki plugins klasorune atin. Pluginleri oyundayken eklemek isterseniz /reload yazin. OP gerekli."
    cd %userprofile%\Desktop\Bukkit_%bukkitVersion%_Sunucu
    goto mceulaop

) else (
    echo Returning To Menu...
    goto mceula
)
goto mcserver

::::::::::::::::::::::::::::::> Minecraft Server Mod - bat.bat
:mcmod
color f
cls
title { bat.bat / Minecraft Modloader }
echo {----------Minecraft Modloader---------} 
echo.
echo  # Select Type
echo.
echo  1} [Forge] Modloader
echo  2} [Fabric] Modloader
echo.
echo {----------Minecraft Mod Source--------} 
echo.
echo  3} [Modrinth] Resource
echo  4} [CurseForge] Resource
echo.
echo {--------------------------------------}
echo  x} Main Menu
echo.

set /p op=">> "
if %op%==1 goto mcforge
if %op%==2 goto mcfabric
if %op%==3 goto mcmodrinth
if %op%==4 goto mccurseforge
if %op%==x goto menu

::::::::::::::::::::::::::::::> Minecraft Forge - bat.bat
:mcforge
color f
cls
title { bat.bat / Minecraft Modloader (Forge) }
echo {----------Minecraft Forge---------} 
start https://files.minecraftforge.net/net/minecraftforge/forge/
echo { Process Complated }
goto mcmod

::::::::::::::::::::::::::::::> Minecraft Fabric - bat.bat
:mcfabric
color f
cls
title { bat.bat / Minecraft Modloader (Fabric) }
echo {----------Minecraft Fabric---------} 
start https://fabricmc.net/use/installer/
echo { Process Complated }
goto mcmod

::::::::::::::::::::::::::::::> Minecraft Modrinth - bat.bat
:mcmodrinth
color f
cls
title { bat.bat / Minecraft Mod Source (Modrinth) }
echo {----------Modrinth---------} 
start https://modrinth.com/mods
echo { Process Complated }
goto mcmod

::::::::::::::::::::::::::::::> Minecraft CurseForge - bat.bat
:mccurseforge
color f
cls
title { bat.bat / Minecraft Mod Source (CurseForge) }
echo {----------CurseForge---------} 
start https://www.curseforge.com/minecraft
echo { Process Complated }
goto mcmod

::::::::::::::::::::::::::::::> Minecraft Server EULA - bat.bat
:mceula
color f
@echo off
cls
title { bat.bat / Minecraft Eula }
echo {----------Minecraft Eula---------} 

set "eulaa=eula.txt"
echo eula=true> %eulaa%

start server.jar

::set "file=eula.txt"
::set "search=eula=false"
::set "replace=eula=true"
::
::setlocal enabledelayedexpansion
::
::timeout /t 5 /nobreak >nul
::
::(for /f "delims=" %%i in ('type "%file%"') do (
::    set "line=%%i"
::    if "!line!"=="%search%" (
::        echo !replace!
::    ) else (
::        echo %%i
::    )
::)) > "%file%.tmp"
::
::move /y "%file%.tmp" "%file%"
goto mcreadmeA

:typeA
cls
echo { Process Complated }
goto menu

::::::::::::::::::::::::::::::> Minecraft Server EULA and Start - bat.bat
:mceulaop
color f
@echo off
cls
title { bat.bat / Minecraft Eula and Start }
echo {----------Minecraft Server Start---------} 

set "eulaa=eula.txt"
echo eula=true> %eulaa%

start run.bat

::set "file=eula.txt"
::set "search=eula=false"
::set "replace=eula=true"

::setlocal enabledelayedexpansion

::(for /f "delims=" %%i in ('type "%file%"') do (
::    set "line=%%i"
::    if "!line!"=="%search%" (
::        echo !replace!
::    ) else (
::        echo %%i
::    )
::)) > "%file%.tmp"

::move /y "%file%.tmp" "%file%"
goto mcreadmeB

:typeB
cls
echo { Process Complated }
pause
goto menu

::::::::::::::::::::::::::::::> Minecraft Server Required Material - bat.bat
:mcrequired
color f
cls
title { bat.bat / Minecraft Developer Required }
echo {----------Minecraft Required---------} 
echo It is completely automatic. Just Wait!
echo Installing Java Runtime Environment (JRE)
echo ____________________________________________________________________________________
winget install Oracle.JavaRuntimeEnvironment --accept-package-agreements --accept-source-agreements
echo Installing Java Development Kit (JDK 22)
echo ____________________________________________________________________________________
winget install Oracle.JDK.22 --accept-package-agreements --accept-source-agreements
echo Installing Java Development Kit (JDK 21)
echo ____________________________________________________________________________________
winget install Oracle.JDK.21 --accept-package-agreements --accept-source-agreements
echo Installing RadminVPN
echo ____________________________________________________________________________________
winget install Famatech.RadminVPN --accept-package-agreements --accept-source-agreements
echo ____________________________________________________________________________________
echo { Process Complated }
pause
goto mcserver

::::::::::::::::::::::::::::::> Minecraft Server ReadME - bat.bat
:mcreadmeA
color f
@echo off
cls
title { bat.bat / Minecraft ReadME }
echo {----------Minecraft ReadME---------} 

    set "readme=okubeni.txt"

    echo Sunucunun server.properties ve diğer ayarlama bilgilendirmesine hoşgeldiniz.  by frostium > %readme%
    echo --------------------------------------------------- >> %readme%
    echo Daha fazla bilgi için; https://minecraft.fandom.com/wiki/Server.properties >> %readme%
    echo - >> %readme%
    echo - >> %readme%
    echo allow-flight=  Sunucuda uçup uçamayacağınızı ayarlar. (true, false)>> %readme%
    echo difficulty=  Sunucunun oyun zorluğunu ayarlar. (peaceful, easy, normal, hard) >> %readme%
    echo enable-command-block=  Sunucudaki komut blou iznini ayarlar. (true, false) >> %readme%
    echo gamemode=  Sunucunun varsayılan oyun modunu ayarlar. (survival, creative, spectator, adventure) >> %readme%
    echo generate-structures=  Dünyadaki yapıların oluşumunu ayarlar. Ör"Köy, Çöl Tapınağı" (true, false) >> %readme%
    echo hardcore=  Sunucunun hardcore modunu ayarlar. (true, false) >> %readme%
    echo level-name=  Sunucu dosyalarındaki dünya dosyasının ismini ayarlar. Sunucuyu bir kere açıp dünya dosyasını oluşturduktan sonra dünya ismini değiştirirseniz, değiştirdiğiniz isimde yeni bir dünya dosyası açar ve dünyanız değişir. >> %readme%
    echo level-seed=  Sunucudaki dünyanın seed kodunu ayarlar. Dünya bir kere oluştuktan sonra dünya seedini değişirseniz etki etmez. Dünya ismini değiştirip yeniden seed girmeniz gerekir.>> %readme% 
    echo level-type=  Sunucudaki dünyanın türünü ayarlar. (normal, flat)>> %readme%
    echo max-build-height= Sunucudaki dünyanın maksimum inşa sınırını belirler.>> %readme%
    echo max-players= Sunucuya maksimum kaç kişi gireceğini ayarlar. >> %readme%
    echo motd=  Çok oyunculu ekranında sunucunun adının altındaki sunucu açıklamasını ayarlar. >> %readme%
    echo online-mode=true   Sunucunuza onaylı kullanıcıların girmesini ayarlar. (true= Sadece Orjinal, false= Korsan ve Orjinal ama skin yok.)>> %readme%
    echo pvp=  Sunucudaki pvp ayarını yapar. (true, false)>> %readme%
    echo server-ip=  En önemli kısım. RadminVPN üzerindeki ipnizi kopyalayıp yapıştırın (RadminVPN üzerinden ağ oluşturup diğer kullanıcıların da ağınızda olduğundan emin olun!!). Modeminde statip ip olanlar da statik ip kullanabilir. >> %readme%
    echo server-port=  Sunucu portunu ayarlar. Varsayılan olarak 25565 bırakırsanız oyuncular sadece ip ile giriş yapabilirler. Eğer değiştirirseniz SunucuIP:SunucuPORT şeklinde oyunculara gönderin. >> %readme%
    echo spawn-animals=  Sunucuda hayvanların doğma ayarını yapar. (true, false) >> %readme%
    echo spawn-monsters=  Sunucuda yaratıkların doğma ayarını yapar. (true, false) >> %readme%
    echo spawn-npcs=  Sunucuda NPClerin doğma ayarını yapar. (true, false) >> %readme%
    echo spawn-protection= Sunucudaki dünyanın doğma koruma genişliğini yapar. 0 kapalı. >> %readme%
    echo view-distance=  Sunucunun görüş mesafesini ayarlar. Oyuncular görüş mesafesini buradaki değerden fazla ayarlasa bile gördükleri mesafe bu değer kadar olur. >> %readme%
    echo white-list=  Sunucuya girebilecek kişileri ayarlar. Açarsanız sunucu klasöründeki whitelist.json dosyasından girmesine izin verdiğiniz kullanıcıların oyun isimlerini girin. (true, false) >> %readme%
    echo - >> %readme%
    echo - >> %readme%
    echo !! Ram ayarlamak için run.bat dosyasına sağ tıklayıp düzenleyin. Xmx değeri en yüksek ram değeridir. Xms ise en az. Ram miktarını 4G olarak Gigabyte formatında veya 4096M şeklinde Megabyte formatında girebilirsiniz. >> %readme%    
    echo !! Eğer oyuncular size RadminVPN ile bağlı olup da sunucuya giremiyorlarsa Windows Güvenlik Duvarını devre dışı bırakın. bat.bat'ın ana sayfasında da bu ayar mevcuttur.  >> %readme%
goto typeA

::::::::::::::::::::::::::::::> Minecraft Server ReadME - bat.bat
:mcreadmeB
color f
@echo off
cls
title { bat.bat / Minecraft ReadME }
echo {----------Minecraft ReadME---------} 

    set "readme=okubeni.txt"

    echo Sunucunun server.properties ve diğer ayarlama bilgilendirmesine hoşgeldiniz.  by frostium  > %readme%
    echo --------------------------------------------------- >> %readme%
    echo Daha fazla bilgi için; https://minecraft.fandom.com/wiki/Server.properties >> %readme%
    echo - >> %readme%
    echo - >> %readme%
    echo allow-flight=  Sunucuda uçup uçamayacağınızı ayarlar. (true, false)>> %readme%
    echo difficulty=  Sunucunun oyun zorluğunu ayarlar. (peaceful, easy, normal, hard) >> %readme%
    echo enable-command-block=  Sunucudaki komut blou iznini ayarlar. (true, false) >> %readme%
    echo gamemode=  Sunucunun varsayılan oyun modunu ayarlar. (survival, creative, spectator, adventure) >> %readme%
    echo generate-structures=  Dünyadaki yapıların oluşumunu ayarlar. Ör"Köy, Çöl Tapınağı" (true, false) >> %readme%
    echo hardcore=  Sunucunun hardcore modunu ayarlar. (true, false) >> %readme%
    echo level-name=  Sunucu dosyalarındaki dünya dosyasının ismini ayarlar. Sunucuyu bir kere açıp dünya dosyasını oluşturduktan sonra dünya ismini değiştirirseniz, değiştirdiğiniz isimde yeni bir dünya dosyası açar ve dünyanız değişir. >> %readme%
    echo level-seed=  Sunucudaki dünyanın seed kodunu ayarlar. Dünya bir kere oluştuktan sonra dünya seedini değişirseniz etki etmez. Dünya ismini değiştirip yeniden seed girmeniz gerekir.>> %readme% 
    echo level-type=  Sunucudaki dünyanın türünü ayarlar. (normal, flat)>> %readme%
    echo max-build-height= Sunucudaki dünyanın maksimum inşa sınırını belirler.>> %readme%
    echo max-players= Sunucuya maksimum kaç kişi gireceğini ayarlar. >> %readme%
    echo motd=  Çok oyunculu ekranında sunucunun adının altındaki sunucu açıklamasını ayarlar. >> %readme%
    echo online-mode=true   Sunucunuza onaylı kullanıcıların girmesini ayarlar. (true= Sadece Orjinal, false= Korsan ve Orjinal ama skin yok.)>> %readme%
    echo pvp=  Sunucudaki pvp ayarını yapar. (true, false)>> %readme%
    echo server-ip=  En önemli kısım. RadminVPN üzerindeki ipnizi kopyalayıp yapıştırın (RadminVPN üzerinden ağ oluşturup diğer kullanıcıların da ağınızda olduğundan emin olun!!). Modeminde statip ip olanlar da statik ip kullanabilir. >> %readme%
    echo server-port=  Sunucu portunu ayarlar. Varsayılan olarak 25565 bırakırsanız oyuncular sadece ip ile giriş yapabilirler. Eğer değiştirirseniz SunucuIP:SunucuPORT şeklinde oyunculara gönderin. >> %readme%
    echo spawn-animals=  Sunucuda hayvanların doğma ayarını yapar. (true, false) >> %readme%
    echo spawn-monsters=  Sunucuda yaratıkların doğma ayarını yapar. (true, false) >> %readme%
    echo spawn-npcs=  Sunucuda NPClerin doğma ayarını yapar. (true, false) >> %readme%
    echo spawn-protection= Sunucudaki dünyanın doğma koruma genişliğini yapar. 0 kapalı. >> %readme%
    echo view-distance=  Sunucunun görüş mesafesini ayarlar. Oyuncular görüş mesafesini buradaki değerden fazla ayarlasa bile gördükleri mesafe bu değer kadar olur. >> %readme%
    echo white-list=  Sunucuya girebilecek kişileri ayarlar. Açarsanız sunucu klasöründeki whitelist.json dosyasından girmesine izin verdiğiniz kullanıcıların oyun isimlerini girin. (true, false) >> %readme%
    echo - >> %readme%
    echo - >> %readme%
    echo !! Ram ayarlamak için run.bat dosyasına sağ tıklayıp düzenleyin. Xmx değeri en yüksek ram değeridir. Xms ise en az. Ram miktarını 4G olarak Gigabyte formatında veya 4096M şeklinde Megabyte formatında girebilirsiniz. >> %readme%    
    echo !! Eğer oyuncular size RadminVPN ile bağlı olup da sunucuya giremiyorlarsa Windows Güvenlik Duvarını devre dışı bırakın. bat.bat'ın ana sayfasında da bu ayar mevcuttur.  >> %readme%
goto typeB


::::::::::::::::::::::::::::::> Error - bat.bat <::::::::::::::::::::::::::::::
:error
color 4f
cls
title { bat.bat / Error }
echo Unknown Command
ping localhost -n 3 >nul
goto menu
exit