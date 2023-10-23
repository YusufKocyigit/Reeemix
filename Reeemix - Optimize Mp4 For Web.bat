@echo off
setlocal enabledelayedexpansion

rem Display software name
echo.
echo.
echo Reeemix - Optimize Mp4 For Web
echo.
echo.

set /p customize_vars=Do you want to customize the variables (Y/N)? 
echo.
echo.

if /i "!customize_vars!"=="Y" (
    call :custom_variables
) else (
    rem Use hardcoded variables
    set "input_folder=input"
    set "output_folder=output"
    set "output_suffix=_reeemixed"
)

:main
for %%i in ("!input_folder!\*.mp4") do (
    set "input=%%i"
    set "filename=%%~ni"

    rem Create the output folder if it doesn't exist
    if not exist "!output_folder!" mkdir "!output_folder!"
    
    rem Run the ffmpeg command
    ffmpeg -i "!input!" -map 0 -c copy -movflags +faststart "!output_folder!\!filename!!output_suffix!.mp4"
)

echo.
echo.
echo.
echo.
echo Thank you for using Reeemix !
echo.
echo.
echo.
echo.

pause

endlocal
exit

:custom_variables
set /p input_folder=Enter the input folder name/path: 
set /p output_folder=Enter the output folder name/path: 
set /p output_suffix=Enter the output file suffix (leave blank for none): 
goto main
