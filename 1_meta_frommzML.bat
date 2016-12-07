REM V 0.5-20161109
@echo off
REM 
setlocal EnableDelayedExpansion
echo encoded length of Folder
del "meta_data.txt"
set sfolder="D:\03Exported\new"

for /r %sfolder% %%i in (*) do ( 
set var=%%i
set folderinfo=%%i
echo mzML-File:!var!
FINDSTR /O /C:"encodedLength" "!var!"  >tempq.txt
for /f "tokens=1*delims=:" %%G in ('findstr /n "^" tempq.txt') do if %%G equ 2 (set wholeinfo2=%%H%)
set wholeinfo2=!wholeinfo2:*encodedLength=!
SET numbers=!wholeinfo2:"=!
set numbers2=!numbers:~1,-1!
REM echo Quality:!numbers2!
FINDSTR /O /C:" location" "!var!"  >tempID.txt
set /p locationinfo=<tempID.txt
SET locationinfo2=!locationinfo:*location=!
set locationinfo2=!locationinfo2:~1,-12!
REM echo original-file:!locationinfo2!
FINDSTR /O /C:" startTimeStamp" "!var!"  >tempTime.txt
set /p timeinfo=<tempTIME.txt
SET timeinfo2=!timeinfo:*startTimeStamp=!
set timeinfo2=!timeinfo2:~1,-1!
REM echo time:!timeinfo2!
@echo !var! ,!timeinfo2!, !locationinfo2!, !numbers2! >>meta_data.txt
)
del "tempTime.txt"
del "tempID.txt"
del "tempq.txt"
echo finished..
PAUSE
endlocal
