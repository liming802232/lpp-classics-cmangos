@echo off
SET NAME=SPP Updater
TITLE %NAME%
set mainfolder=%CD%

taskkill /f /im realmd.exe
taskkill /f /im mangosd.exe
taskkill /f /im spp-httpd.exe
taskkill /f /im node.exe

:repack
set name=SPP - Classics Collection
set installpath=SPP_Server
set branch=master
cls
echo #########################################################
echo # WARNING(警告)!                                         #
echo # All your changes will be undone, including:           #
echo # 将撤销所有更改，包括：                                    #
echo # Server settings, Bot settings, AHBot settings         #
echo # 服务器设置，Bot设置，AHBot设置                            #
echo # Settings will be copied to Settings_Old folder        #
echo # 设置将被复制到Settings_Old文件夹                         #                            #
echo # Still it's better to backup!                          #
echo # 还是备份比较好！                                         #
echo #########################################################
echo.
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure(你确定吗) (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" exit
goto start_restore

:start_restore
cls
if not exist "%mainfolder%\%installpath%\launcher.bat" goto not_installed_error
cd "%mainfolder%\%installpath%"
robocopy Settings Settings_Old /E
..\git\cmd\git.exe reset --hard HEAD
ping -n 5 127.0.0.1>nul
cls
echo.
echo  All files are restored.
echo  还原所有文件。
echo  If you had problems with updating please run Server_Update.bat
echo  如果您在更新时遇到问题，请运行Server_Update.bat
echo  to update properly
echo  以正确更新
echo.
echo  Old Settings are copied to Settings_Old folder
echo  旧设置已复制到Settings_Old文件夹
echo.
pause
exit

:not_installed_error
cls
echo Looks like %name% repack is not installed.
echo 似乎未安装%name% 重制版
echo Please use "Server_Update.bat" to install it first.
echo 请先使用"Server_Update.bat"进行安装。
echo.
more < "%mainfolder%\Git\robo_logo.txt"
pause
goto menu
