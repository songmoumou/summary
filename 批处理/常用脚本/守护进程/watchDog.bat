@echo off
::检测时间间隔，单位：秒
set _interval=60
::需要守护的进程名称
set _processName=JAVAPROJECT
::需要守护的进程启动命令
set _processCmd=java -jar .\base.jar
::需要守护的进程预估启动完毕所需时间，单位：秒
set _processTimeout=30
::需要守护的进程所监听的端口
set _port=8080
::进程用户名，一般是Administrator
set _username=Administrator
:LOOP
set /a isAlive=false
::通过进程名称检测
::tasklist /FI "username eq %_username%" | find /C "%_processName%" > temp.txt
::set /p num= < temp.txt
::del /F temp.txt
::通过进程的端口是否正在被监听检测
netstat -an | find /C "0.0.0.0:%_port%" > temp.txt
set /p num= < temp.txt
del /F temp.txt
if "%num%" == "0" (
start %_processCmd% | echo 启动 %_processName% 于 %time%
choice /D y /t %_processTimeout% > nul
)
if "%num%" NEQ "0" echo 已启动
::ping -n %_interval% 127.1>nul
choice /D y /t %_interval% >nul
goto LOOP
::该脚本运行后会出现一个dos窗口，若觉得碍眼可以用记事本将下面保存为扩展名为.vbs的文件。其中guard.bat是上面批处理保存的文件名。两个文件放在同一目录下双击vbs文件后，守护进程就在后台运行了，单这样得通过资源管理器结束cmd进程才能停止守护进程。
::set ws=WScript.CreateObject("WScript.Shell")
::ws.Run "guard.bat",0