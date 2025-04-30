@echo off
setlocal

:: Paths
:: %~dp0 means "Current Directory" i.e the directory of the .bat file.
set "ZIP_URL=https://github.com/JesperWeble/DoW-Map-Updater/archive/refs/heads/main.zip"
set "TEMP_ZIP=%~dp0mapUpdaterTEMP.zip"
set "EXTRACTED_FOLDER=%~dp0mapUpdaterTEMP"
set "TARGET_FOLDER=%~dp0DXP2"

:: Download

powershell -Command "Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%TEMP_ZIP%'"
if exist "%EXTRACTED_FOLDER%" rmdir /s /q "%EXTRACTED_FOLDER%"


:: Extract
powershell -Command "Expand-Archive -Path '%TEMP_ZIP%' -DestinationPath '%EXTRACTED_FOLDER%'"
xcopy "%EXCTRACTED_FOLDER%\DXP2\*" "%TARGET_FOLDER%\" /s /y

:: Cleanup
del "%TEMP_ZIP%"
rmdir /s /q "%EXTRACTED_FOLDER%"

echo Update Complete!
pause








@REM @echo off
@REM setlocal

@REM :: Set working paths
@REM set "ZIP_URL=URL for zip download here"
@REM set "TEMP_ZIP=%~dp0temp.zip"
@REM set "EXTRACTED_FOLDER=%~dp0extracted"
@REM set "TARGET_FOLDER=%~dp0URL for local folder name here"

@REM :: Download the zip file
@REM powershell -Command "Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%TEMP_ZIP%'"

@REM :: Remove old extracted folder if it exists
@REM if exist "%EXTRACTED_FOLDER%" rmdir /s /q "%EXTRACTED_FOLDER%"

@REM :: Extract zip
@REM powershell -Command "Expand-Archive -Path '%TEMP_ZIP%' -DestinationPath '%EXTRACTED_FOLDER%'"

@REM :: Copy new files to target folder
@REM xcopy "%EXTRACTED_FOLDER%\URL for folder inside zip here\*" "%TARGET_FOLDER%\" /s /e /y

@REM :: Cleanup
@REM del "%TEMP_ZIP%"
@REM rmdir /s /q "%EXTRACTED_FOLDER%"

@REM echo Done.
@REM pause