; 弹丸论破辅助按键工具
; alt+右键, 开/关右键自动播放

; dr_rbutton_flag := True
get_DR_WIN_TITLE(){
	; return "ahk_exe notepad.exe"
	return "ahk_exe Dangan3Win.exe"
}

UpdateState(){
	global dr_rbutton_flag ; 使函数内可引用全局变量
	ShowText(dr_rbutton_flag ? "ON" : "OFF")
}

ShowText(text){
	ToolTip, % text, 0, 0
	Sleep, 1000
	ToolTip
}

; 弹丸按键辅助
#If, WinActive(get_DR_WIN_TITLE())
f::LButton
g::RButton
!RButton:: 
dr_rbutton_flag := !dr_rbutton_flag ; dr_rbutton_flag未初始化, 默认为"", 相当于False
UpdateState()
Return
#If

#If, dr_rbutton_flag && WinActive(get_DR_WIN_TITLE())
RButton::Space
#If