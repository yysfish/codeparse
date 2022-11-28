::curl -X POST "http://172.16.6.203/base/api/v1/base/user/confusion_login" -H "accept: application/json;charset=UTF-8" -H "W-FLOW: canary" -H "W-SEQ: 9999" -H "X-DEBUG: hybrid" -H "Content-Type: application/json" -d "{\"username\": \"L10044\", \"password\": \"NjU0\"}"
@echo off
:: window需要安装curl才能执行该脚本，win10默认安装了curl
:: 利用curl访问203的登录接口，然后根据冒号:截取出参，从得到的结果中取第五个
:: %%~i对比%%i，结果中的字符串的两边如果有双引号，就会去掉
for /f "delims=: tokens=5" %%i in (' curl -X POST "http://192.168.39.154:41800/base/api/v1/base/user/confusion_login" -H "accept: application/json;charset=UTF-8" -H "W-FLOW: canary" -H "W-SEQ: 9999" -H "X-DEBUG: hybrid" -H "Content-Type: application/json" -d "{\"username\": \"L10044\", \"password\": \"NjU0\"}" ') do (
	set wintoken=%%~i	
)
:: 上一步截取得到的字符串 后面还有一些字符串要去掉
:: 去掉末尾的14位
set wintoken=%wintoken:~0,-14%

:: 将获取到的token，在前面拼接Bearer 
set "wintoken=Bearer %wintoken%"

:: 将token复制到剪切板中
:: echo %wintoken%>tmp.txt 直接用echo命令把token放入到剪切板会自动带一个换行符
set /p=%wintoken%<nul>tmp.txt
clip<tmp.txt
del tmp.txt