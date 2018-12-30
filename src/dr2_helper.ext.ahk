; 弹丸论破辅助按键工具
; alt+右键, 开/关右键自动播放

; dr2_rbutton_flag := True
get_DR2_WIN_TITLE(){
	; return "ahk_exe notepad.exe"
	return "ahk_exe DR2_us.exe"
}

UpdateState(){
	global dr2_rbutton_flag ; 使函数内可引用全局变量
	ShowText(dr2_rbutton_flag ? "ON" : "OFF")
}

ShowText(text){
	ToolTip, % text, 0, 0
	Sleep, 1000
	ToolTip
}

; 弹丸2按键辅助
#If, WinActive(get_DR2_WIN_TITLE())
f::LButton
g::RButton
!RButton:: 
dr2_rbutton_flag := !dr2_rbutton_flag ; dr2_rbutton_flag未初始化, 默认为"", 相当于False
UpdateState()
Return
#If

#If, dr2_rbutton_flag && WinActive(get_DR2_WIN_TITLE())
RButton::Space
#If

; InitGui(){
; 	global
; 	Gui +LastFound +AlwaysOnTop -Caption +ToolWindow ; 设置基本的窗口属性, 置顶等
; 	; Gui, Color, FFFF00 ; 窗口背景颜色
; 	Gui, add, Text, vMyText, XXX ; 添加文本框, id为MyText, 默认文本为XXX
; }

; ShowText(text){
; 	global
; 	Gui, Show, x0 y0, NoActivate ; 在(0, 0)处显示窗口
; 	GuiControl, , MyText, % text ; 更新MyText的文本
; 	Sleep, 1000
; 	Gui, Hide ; 隐藏窗口
; }