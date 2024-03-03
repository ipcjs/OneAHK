#If, False
; 重启PRime的脚本
^!+Space::
Process, Close, PIMELauncher.exe
Run, C:\Program Files (x86)\PIME\PIMELauncher.exe
Return
#If

; 重新部署Rime
#!`::Run, "C:\Program Files (x86)\Rime\weasel-0.15.0\WeaselDeployer.exe" /deploy

; 确保算法服务启动
; https://github.com/rime/home/issues/596#issuecomment-697297157
RimeEnsureWeaselServer:
Process, Wait, WeaselServer.exe, 20
rime_pid = %ErrorLevel%
if (rime_pid = 0) {
    Run, "C:\Program Files (x86)\Rime\weasel-0.15.0\WeaselServer.exe"
}
Return
