; �������л�Chrome����
#If, (WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe firefox.exe")) && MouseIsTopOnActiveWin()
WheelUp::SendBySleep("^{PgUp}")
WheelDown::SendBySleep("^{PgDn}")
MouseIsTopOnActiveWin(Edge := 48){
	CoordMode, Mouse, Window
	MouseGetPos, X, Y
	WinGetPos, , , Width, Height, A ; ��ȡ����ڵĿ��
	return Y < Edge And Y >= 0 And X >= 0 And X <= Width ; ���Ҫ�ڻ���ڷ�Χ��
}
#If

SendBySleep(key, sleep_time := 200){
	SendInput %key%
	Sleep, sleep_time
}