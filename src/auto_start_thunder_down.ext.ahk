; ��Ѹ���½���BT�����Զ����ȷ��

CheckNewTaskAlert:
if WinExist("�½�BT���� ahk_class XLUEModalHostWnd ahk_exe Thunder.exe"){
	WinActivate
	SendInput, ^{Enter}
}
if WinExist("MessageBox ahk_class XLUEModalHostWnd ahk_exe Thunder.exe"){
	WinActivate
	SendInput, {Esc}
}

Return
