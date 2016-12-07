REM V 0.1-20160607
@echo off
REM Export all fid from new folders
setlocal EnableDelayedExpansion
echo listfids of Folder
set sfolder="F:\01MSData\2016_2"

for /r "%sfolder%" %%i in (info*) do ( 
set var=%%i
set folderinfo=%%i
REM echo !folderinfo!
FINDSTR  /O /C:"AnalyteId" "!var!"  >temp.txt
set /p wholeinfo=<temp.txt
set fidurl=!folderinfo!
set wholeinfo2=!wholeinfo:*AnalyteId":"=!
SET _endbit=!wholeinfo2:*"=!
CALL SET wholeinfo3=%%wholeinfo2:!_endbit!=%%
set wholeinfo4=!wholeinfo3:"=!
SET fidurl2=!fidurl:~0,-5!\
REM echo !fidurl2!
set /A COUNTER=COUNTER+1
 echo !COUNTER!
set fidurl3="!fidurl2!"
	pushd !fidurl3!
	for /r %%a in (*) do if "%%~nxa"=="fid" (set p=%%~dpnxa)
	popd
REM echo !p!
echo !wholeinfo4!
CompassXport\CompassXport.exe   -raw 1 -log all -a "!p!"  -mode 2 -o "F:\03Exported\2016_2\!wholeinfo4!-!COUNTER!"
)
echo finished..
PAUSE
endlocal
