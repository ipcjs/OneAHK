; 对迅雷新建的BT任务自动点击确定

CheckNewTaskAlert:
if WinExist("新建BT任务 ahk_class XLUEModalHostWnd ahk_exe Thunder.exe"){
	WinActivate
	SendInput, ^{Enter}
}
if WinExist("MessageBox ahk_class XLUEModalHostWnd ahk_exe Thunder.exe"){
	WinActivate
	SendInput, {Esc}
}

Return
