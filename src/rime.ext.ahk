#If, False
; 重启PRime的脚本
^!+Space::
Process, Close, PIMELauncher.exe
Run, C:\Program Files (x86)\PIME\PIMELauncher.exe
Return
#If

; 重新部署Rime
#!`::Run, "C:\Program Files (x86)\Rime\weasel-0.15.0\WeaselDeployer.exe" /deploy
