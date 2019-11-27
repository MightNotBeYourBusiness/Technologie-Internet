@echo off
::set PATH=%PATH%;D:\DonnÃ©es\Documents\Helha2\TI
git status
color 0e


echo.
echo.
:menu

echo ------------------------------------
echo       Make your choice (1-6)
echo.
echo 	[1] Pull
echo 	[2] Push
echo 	[3] More options
echo 	[4] Change proxy for School
echo 	[5] Reset proxy 
echo		[6] Exit
echo.
echo ------------------------------------
set /p choix=
	if %choix% ==1 GOTO PULL
	if %choix% ==2 GOTO PUSH
	if %choix% ==3 GOTO start
	if %choix% ==4 GOTO configProxy
	if %choix% ==5 GOTO resetProxy
	if %choix% ==6 GOTO exit
	
:pull

echo.
echo ------------------------------------
echo.
echo	[1] Pull current folder
echo	[2] Pull All
echo.
echo ------------------------------------
set /p choix3=
	if %choix3% ==1 GOTO PullOne
	if %choix3% ==2 GOTO PullAll
	
:pullOne

set curentPath=%cd%
git pull
echo.
echo.
echo ------------------------------------
echo	Pull finished successfully
echo.
echo		[1] Return to Menu
echo 	[2] exit
echo.
echo ------------------------------------
set /p choix2=
	if %choix2% ==1 GOTO menu
	if %choix2% ==2 GOTO exit
	
:pullAll

echo.
echo.
echo pull Java Design Pattern
echo.
::set PATH=%PATH%;D:\DonnÃ©es\Documents\Helha2\TI
::git pull
::set path1=%path%;D:\Données\Documents\Helha2\Workspace Design patterns
::git pull

::set path2=%path%;D:\Données\Documents\Helha2\Workspace Cour Java
::git pull

cd D:\Données\Documents\Helha2\Workspace Design patterns
echo %cd%
cd D:\DonnÃ©es\Documents\Helha2\Workspace Cour Java
echo %cd%

echo.
echo.
echo ------------------------------------
echo	Pull All finished successfully
echo.
echo		[1] Return to Menu
echo 	[2] exit
echo.
echo ------------------------------------
set /p choix2=
	if %choix2% ==1 GOTO menu
	if %choix2% ==2 GOTO exit

:push

echo.
git add -A
git status
echo Name of commit : 
set /p name=
git commit -a -m "%name%"
git push

echo.
echo.
echo.
echo ------------------------------------
echo	Push finished successfully
echo.
echo		[1] Return to Menu
echo 	[2] exit
echo.
echo ------------------------------------
set /p choix2=
	if %choix2% ==1 GOTO menu
	if %choix2% ==2 GOTO exit

:start

START C:\"Program Files"\Git\git-bash.exe
pause
exit

:configProxy

git config --global http.proxy http://172.30.0.101:8080/

echo.
echo.
echo ------------------------------------
echo.
echo 	Proxy successfully modified
echo. 
echo		[1] Return to Menu
echo 	[2] exit
echo.
echo ------------------------------------
set /p choix2=
	if %choix2% ==1 GOTO menu
	if %choix2% ==2 GOTO exit

:resetProxy

git config --global --unset http.proxy

echo.
echo ------------------------------------
echo.
echo 	Proxy reset succesfull
echo.
echo		[1] Return to Menu
echo 	[2] exit
echo.
echo ------------------------------------
set /p choix2=
	if %choix2% ==1 GOTO menu
	if %choix2% ==2 GOTO exit

:exit
exit

pause