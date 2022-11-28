@echo off

REM 获取本机IP
for /f "delims=: tokens=2" %%i in ('ipconfig ^| find /i "IPv4"') do set ip=%%i 
set "ip=%ip:~1,-1%"

REM 根据端口是否被占用来判断项目有没有启动 如果启动就组装url 然后用谷歌浏览访问url
REM 因为命令netstat -ano |findstr "端口号" 查询出来的结果，对同一个端口号有两记录(ipv4和ipv6)，为了避免在for循环中解析出相同的端口号，就加0:用来过滤ipv6的记录
for /f "delims=: tokens=2" %%i in ('netstat -ano ^|findstr " 0.0:42900  0.0:41320  0.0:42210  0.0:22200  0.0:32200  0.0:12200  0.0:41950  0.0:42200  0.0:41310  0.0:21800  0.0:41810  0.0:11800  0.0:41800  0.0:42920  0.0:41820  0.0:21140  0.0:28090 0.0:31140 0.0:41990"') do (
	if "%%i" neq "" (
		for /f "tokens=1" %%a in ("%%i") do (
			start chrome.exe http://%ip%:%%a/swagger-ui.html
		)
		
	)
)





