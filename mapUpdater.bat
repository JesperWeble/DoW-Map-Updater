@echo off
setlocal
if "%~1" == "updated" exit
:: Paths
:: %~dp0 means "Current Directory" i.e the directory of the .bat file.
set "ZIP_URL=https://github.com/JesperWeble/DoW-Map-Updater/archive/refs/heads/main.zip"
set "TEMP=DoW-Map-Updater-main"
set "TEMP_ZIP=%~dp0%TEMP%.zip"
set "EXTRACTED_FOLDER=%~dp0mapUpdaterTEMP"
set "TARGET_FOLDER=%~dp0\DXP2"

:: Download
certutil -urlcache -split -f "%ZIP_URL%" "%TEMP_ZIP%" >nul
if not exist "%TEMP_ZIP%" (
    echo ERROR: file was not downloaded.
    pause
)
echo %TEMP%.zip exists
if not exist "%EXTRACTED_FOLDER%" mkdir "%EXTRACTED_FOLDER%"

:: Extract
tar -xf "%TEMP_ZIP%" -C "%EXTRACTED_FOLDER%" >nul
echo extraction complete.

:: Update this file
copy "%EXTRACTED_FOLDER%\%TEMP%\mapUpdater.bat" "%~dp0" /y


xcopy "%EXTRACTED_FOLDER%\%TEMP%\DXP2\*" "%TARGET_FOLDER%\" /s /y

:: Cleanup
del "%TEMP_ZIP%"
rmdir /s /q "%EXTRACTED_FOLDER%"

start "" "%~dp0mapUpdater.bat" updated

echo Update Complete!
pause




@REM bitsadmin /transfer downloadOperation /download /priority high "%ZIP_URL%" "%TEMP_ZIP%"