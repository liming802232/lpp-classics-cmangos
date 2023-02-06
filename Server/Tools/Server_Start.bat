mode con: cols=40 lines=30
@echo off
SET NAME=SPP Server Launcher
TITLE %NAME%
set mainfolder=%CD%

if NOT exist "%mainfolder%\SPP_Server\launcher.bat" goto not_installed
:start_server
cd "%mainfolder%\SPP_Server"
Launcher.bat
exit

:not_installed
echo.
echo  %NAME% is not installed
echo  %NAME% 启动器未安装
echo.
echo  Please run Server_Update.bat to install
echo  请运行Server_Update.bat进行安装
more < "%mainfolder%\Git\robo_logo.txt"
echo.
pause
exit
