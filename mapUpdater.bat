@echo off
setlocal

:: Paths
:: %~dp0 means "Current Directory" i.e the directory of the .bat file.
set "ZIP_URL=https://github.com/JesperWeble/DoW-Map-Updater/archive/refs/heads/main.zip"
set "TEMP_ZIP=%~dp0mapUpdaterTEMP.zip"
set "EXTRACTED_FOLDER=%~dp0mapUpdaterTEMP"
set "TARGET_FOLDER=%~dp0DoW-Map-Updater-main\DXP2"

:: Download
bitsadmin /transfer downloadOperation /download /priority high "%ZIP_URL%" "%TEMP_ZIP%"
@REM powershell -Command "Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%TEMP_ZIP%'"
if exist "%EXTRACTED_FOLDER%" rmdir /s /q "%EXTRACTED_FOLDER%"


:: Extract
tar -xf "%TEMP_ZIP%" -C "%EXTRACTED_FOLDER%"
@REM powershell -Command "Expand-Archive -Path '%TEMP_ZIP%' -DestinationPath '%EXTRACTED_FOLDER%'"
xcopy "%EXCTRACTED_FOLDER%\DXP2\*" "%TARGET_FOLDER%\" /s /y

:: Cleanup
del "%TEMP_ZIP%"
rmdir /s /q "%EXTRACTED_FOLDER%"

echo Update Complete!
pause