REM V 0.2-20161110 - check file and info before continuing
PAUSE
@echo off

for /f "delims=" %%l in (%selectorenliste%) do (
	set sourcename=%%l
	REM correct first the source folder by removing /1/1SLin
	set sourcedir=!sourcename:~0,-8!
	echo !sourcedir!
	REM now delete everything before the dir to get the future foldername
	set sourcename=!sourcedir:~27,500!
	REM echo %outputfolder%!sourcename!
	xcopy "!sourcedir!" "%outputfolder%!sourcename!" /E /I /Y
)

endlocal
PAUSE
