@echo off

REM ��ȡ����IP
for /f "delims=: tokens=2" %%i in ('ipconfig ^| find /i "IPv4"') do set ip=%%i 
set "ip=%ip:~1,-1%"

REM ���ݶ˿��Ƿ�ռ�����ж���Ŀ��û������ �����������װurl Ȼ���ùȸ��������url
REM ��Ϊ����netstat -ano |findstr "�˿ں�" ��ѯ�����Ľ������ͬһ���˿ں�������¼(ipv4��ipv6)��Ϊ�˱�����forѭ���н�������ͬ�Ķ˿ںţ��ͼ�0:��������ipv6�ļ�¼
for /f "delims=: tokens=2" %%i in ('netstat -ano ^|findstr " 0.0:42900  0.0:41320  0.0:42210  0.0:22200  0.0:32200  0.0:12200  0.0:41950  0.0:42200  0.0:41310  0.0:21800  0.0:41810  0.0:11800  0.0:41800  0.0:42920  0.0:41820  0.0:21140  0.0:28090 0.0:31140 0.0:41990"') do (
	if "%%i" neq "" (
		for /f "tokens=1" %%a in ("%%i") do (
			start chrome.exe http://%ip%:%%a/swagger-ui.html
		)
		
	)
)





