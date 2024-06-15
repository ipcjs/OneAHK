; 确保算法服务启动
; https://github.com/rime/home/issues/596#issuecomment-697297157
RimeEnsureWeaselServer:
Process, Wait, WeaselServer.exe, 1
rime_pid = %ErrorLevel%
if (rime_pid = 0) {
    Run, "C:\Program Files (x86)\Rime\weasel-0.15.0\WeaselServer.exe"
}
RimeEnsureWeaselServerCount += 1
if (RimeEnsureWeaselServerCount >= 5) {
    SetTimer, , Off
}
Return
