@echo off

REM ��ȡ����IP
for /f "delims=: tokens=2" %%i in ('ipconfig ^| find /i "IPv4"') do set ip=%%i 
set "ip=%ip:~1,-1%"

REM ���ݶ˿��Ƿ�ռ�����ж���Ŀ��û������ �����������װurl Ȼ���ùȸ��������url
REM ��Ϊ����netstat -ano |findstr "�˿ں�" ��ѯ�����Ľ������ͬһ���˿ں�������¼(ipv4��ipv6)��Ϊ�˱�����forѭ���н�������ͬ�Ķ˿ںţ��ͼ�0:��������ipv6�ļ�¼
for /f "delims=: tokens=2" %%i in ('netstat -ano ^|findstr "0:9845 0:9803"') do (
	if "%%i" neq "" (
		for /f "tokens=1" %%a in ("%%i") do (
			start chrome.exe http://%ip%:%%a/winning-tms/doc.html
		)
		
	)
)





