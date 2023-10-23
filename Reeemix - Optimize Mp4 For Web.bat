@echo off
setlocal enabledelayedexpansion

rem Display software name
echo.
echo.
echo Reeemix - Optimize Video Files for the Web
echo.
echo.

set /p customize_vars=Do you want to customize the input/output folder's name and the output file's suffix (Y/N)? 
echo.
echo.

if /i "!customize_vars!"=="Y" (
    echo.
    echo Setting custom variables
    echo.
    set /p input_folder="Enter the input folder name/path (leave empty to use the default folder reeemix_input):" 
    set /p output_folder="Enter the output folder name/path (leave empty to use the default folder reeemix_output):" 
    set /p output_suffix="Enter the output file suffix (leave blank for none):" 
    echo.
    rem Check if input and output folder are empty, and if so, use the defaults
    if not defined input_folder ( 
        echo Using the default input folder
        set "input_folder=reeemix_input"
        echo.
    )
    if not exist "!input_folder!" (
            mkdir "!input_folder!"
            echo Creating the default input folder, as it doesn't exist
            echo Put your files inside the !input_folder! folder and click on enter
            echo.
            pause
    )

    if not defined output_folder (
        set "output_folder=reeemix_output"
    	echo Using the default output folder
        echo.
    )

    if not exist "!output_folder!" (
        mkdir "!output_folder!"
        echo Creating the default output folder, as it doesn't exist
        echo.
    )
    
    goto main  
) else (
    echo.
    rem Use hardcoded variables if user chooses not to customize
    echo Using hardcoded variables
    echo.
    set "input_folder=reeemix_input"
    set "output_folder=reeemix_output"
    set "output_suffix=_reeemixed"

    rem Create the input folder if it doesn't exist
    
    if not exist "!input_folder!" (
        mkdir "!input_folder!"
        echo Creating the default input folder, as it doesn't exist
        echo Put your files inside the !input_folder! folder and click on enter
        echo.
        pause
    )

    
    if not exist "!output_folder!" (
        mkdir "!output_folder!"
        echo Creating the default output folder, it doesn't exist
        echo.
    )

    goto main    
)

:main
for %%i in ("!input_folder!\*.*") do (
    set "input=%%i"
    set "filename=%%~ni"
    set "extension=%%~xi"

    rem Run the ffmpeg command
    ffmpeg -i "!input!" -map 0 -c copy -movflags +faststart "!output_folder!\!filename!!output_suffix!!extension!"
)

echo.
echo.
echo.
echo.
echo Thank you for using Reeemix!
echo.
echo.
echo.
echo.

pause

endlocal
exit
