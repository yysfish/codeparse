@echo off
::根据进程名获取进程ID
for /f "delims=, tokens=2" %%a in ('tasklist /fo csv /nh ^| findstr w3wp.exe') do (set pid=%%a)

::去掉两个的"
::set pid=%pid:~1,-1%
set pid=%pid:"=%

::将得到的进程ID放入剪切板中
::echo %pid%>tmp.txt 用echo命令把pid放入到txt中会自动带一个换行符
set /p=%pid%<nul>tmp.txt
clip<tmp.txt
del tmp.txt