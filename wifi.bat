@echo off
::
:: 展示当前电脑所有连接成功过的wifi及其密码
::
for /f "delims=: tokens=2" %%i in ('netsh wlan show profiles') do (
	for /f "delims=: tokens=2" %%j in ('netsh wlan show profiles %%i key^=clear ^| findstr 关键内容') do (
		echo wifi名称:%%i;密码:%%j
	)
)

pause