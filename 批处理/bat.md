##在Windows通过批处理获取系统信息保存为txt文件，而后自动打开该文件
```batch
@echo off
set date=%date:~0,4%-%date:~5,2%-%date:~8,2%
echo "当前时间为："%date%
cd /d "D:\"
mkdir SystemInfo
cd /d "SystemInfo"
systeminfo>systeminfo%date%.txt
start systeminfo%date%.txt
pause
```