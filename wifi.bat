@echo off
::
:: չʾ��ǰ�����������ӳɹ�����wifi��������
::
for /f "delims=: tokens=2" %%i in ('netsh wlan show profiles') do (
	for /f "delims=: tokens=2" %%j in ('netsh wlan show profiles %%i key^=clear ^| findstr �ؼ�����') do (
		echo wifi����:%%i;����:%%j
	)
)

pause