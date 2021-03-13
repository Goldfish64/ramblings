@echo off
SET TARGET=F:

cls
echo Put wofadk.sys from Windows 10 ADK 1507 in %systemroot%\system32\drivers.
echo This batch will add registry settings for wofadk.sys
echo You can use a Win10 WinPE to compact /s /c /a /i /f /EXE:LZX to compress the system.
echo Once this is done, you need to delete the Boot directory (from Win10 PE) and then do "bcdboot C:\Windows" to install Windows 10 BCD loader, which understands LZX.
REM echo and will copy the file to the drive %TARGET%
echo.
pause

cls
echo Loading registry Hive -
echo.
rem reg.exe load HKLM\_SYSTEM %TARGET%\Windows\system32\config\system
echo.
echo.
echo.

echo Adding WofAdk registry settings - 
echo.
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v Discription /t REG_SZ /d "WofAdk Mini-Filter Driver" /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v DisplayName /t REG_SZ /d "WofAdk" /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v ErrorControl /t REG_DWORD /d 1 /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v Group /t REG_SZ /d "FSFilter Compression" /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v Start /t REG_DWORD /d 0 /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v SupportedFeatures /t REG_DWORD /d 3 /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v Type /t REG_DWORD /d 2 /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v DebugFlags /t REG_DWORD /d 0 /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v AutoAttach /t REG_DWORD /d 1 /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v Tag /t REG_DWORD /d 2 /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v DependOnService /t REG_MULTI_SZ /d FltMgr /f
reg.exe add HKLM\SYSTEM\CurrentControlSet\services\WofAdk /v ImagePath /t REG_EXPAND_SZ /d \SystemRoot\System32\drivers\wofadk.sys /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\WofAdk\Instances" /v DefaultInstance /t REG_SZ /d "WofAdk Instance" /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\WofAdk\Instances\WofAdk Instance" /v Altitude /t REG_SZ /d 40730 /f
reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\WofAdk\Instances\WofAdk Instance" /v Flags /t REG_DWORD /d 0 /f
echo.
echo.
echo.

echo Unloading registry Hive -
echo.
REM reg.exe unload HKLM\_SYSTEM
echo.
echo.
echo.

echo Copying wofadk.sys 
echo.
REM copy %~dp0wofadk.sys %TARGET%\Windows\System32\drivers
echo.
echo.
echo.
pause