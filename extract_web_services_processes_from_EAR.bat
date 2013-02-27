:: Date: 2013-02-27 
:: :: Author: Isaac
:: :: v7.6 7zip extraction does not use _ as the folder name
:: :: v7.5 enhancement on xcopy 
:: :: v7.4 merge the CAP / B2BFTS to one batch file. 
:: :: v7.3 do not show "Error: cannot find archive" by 7zip
:: :: v7 new workaround, step1 copy all *.ear to the web_service folder . No hardcode for 'BAOA', 'OTHERS', 'FB', 'HR' 
:: :: v6 handle space in folder name 
:: :::
::
:: echo on
:: set /p InputPath="Enter the release CD software folder name:  "%=%
:: set ear_file_parent_path=C:\ReleaseCD\%InputPath%\cap_fi\deployment.disk\cap\_APP_EARS
:: set web_service_directory=C:\Web_Services\%InputPath%
:: if not exist "%web_service_directory%" mkdir "%web_service_directory%"
::
:: cd "C:\CAPTOOLS\7-ZipPortable\App\7-Zip" 
::
:: :: tokens 8 is BAOA/HR/FB/OTHERS/B2BFTS, that's the 8-th layer of the directory "C:\ReleaseCD\%InputPath%\cap_fi\deployment.disk\cap\_APP_EARS\HR\*.ear"
:: :: xcopy , (f) file or (d) directory, /y suppress prompt to confirm overwriting a file
::  
::  for /f "tokens=8,9 delims=\"  %%e in ('dir /b /s "%ear_file_parent_path%\*.ear" ') do  echo yd | xcopy /E "%ear_file_parent_path%\%%e\%%f" "%web_service_directory%\"
::
::  :: Extraction 
::  :: ~p Path only 
::  :: ~n File name only without extension, ~x File extension only 
::
::  for /r   "%web_service_directory%"  %%G in (*.ear) do ( if exist "%%G" 7z x "%%G" -yo"%%~pG\%%~nG\" )
::  for /r   "%web_service_directory%"  %%H in (*.par) do ( if exist "%%H" 7z x "%%H" -yo"%%~pH\%%~nH\" )
::  for /r   "%web_service_directory%"  %%I in (*.sar) do ( if exist "%%I" 7z x "%%I" -yo"%%~pI\%%~nI\" )
::  for /r   "%web_service_directory%"  %%J in (*.zip) do ( if exist "%%J" 7z x "%%J" -yo"%%~pJ\%%~nJ\" )
