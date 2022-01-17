; 鼠标滚轮切换Chrome窗口
#If, (WinActive("ahk_exe chrome.exe") || WinActive("ahk_exe firefox.exe") || WinActive("ahk_exe msedge.exe")) && MouseIsTopOnActiveWin()
WheelUp::SendBySleep("^{PgUp}")
WheelDown::SendBySleep("^{PgDn}")
MouseIsTopOnActiveWin(Edge := 48){
	CoordMode, Mouse, Window
	MouseGetPos, X, Y
	WinGetPos, , , Width, Height, A ; 获取活动窗口的宽高
	return Y < Edge And Y >= 0 And X >= 0 And X <= Width ; 鼠标要在活动窗口范围内
}
#If

SendBySleep(key, sleep_time := 200){
	SendInput %key%
	Sleep, sleep_time
}