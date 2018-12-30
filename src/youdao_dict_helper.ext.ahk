; 有道词典单词本 辅助
#If, WinActive(GetYoudaoWinTitle())
~RButton & LButton::
!RButton::ToYoudaoHotkeyFlag()
; LButton:: ToolTip(A_TimeSincePriorHotkey)

#If, !YoudaoHotkeyFlag && WinActive(GetYoudaoWinTitle())  ; YoudaoHotkeyFlag默认为False, 表示开启热键...
LButton::
RButton::
%A_ThisHotkey%ClickCount ++
SetTimer, %A_ThisHotkey%Click, -300
Return
; 使用滚轮, 关闭快捷键
WheelUp::
WheelDown::ToYoudaoHotkeyFlag()
#If

; %A_ThisHotkey%Click
LButtonClick:
; ToolTips(A_TimeSincePriorHotkey, LButtonClickCount)
if (LButtonClickCount == 1) {
	Send, % LButtonYDFlag ? "{Left}" : "{Space}" ; LButtonYDFlag默认为False, 先发送空格
	LButtonYDFlag := !LButtonYDFlag
} else if (LButtonClickCount == 2) {
	Send, {Space}{Left}
	; ToolTips("Next")
} else if (LButtonClickCount == 3) {
	; alt+tab切换到单词本后, 默认不会捕获键盘输入, 要点击一下单词界面
	Send, {LButton}
	ToolTip("左键")
}
LButtonClickCount := 0
Return

; %A_ThisHotkey%Click
RButtonClick:
if (RButtonClickCount == 1) {
	Send, {Right}
	LButtonYDFlag := !LButtonYDFlag
} else if (RButtonClickCount == 3) {
	Send, {RButton}
	ToolTip("右键")
}
RButtonClickCount := 0
Return


ToYoudaoHotkeyFlag(){
	global YoudaoHotkeyFlag
	YoudaoHotkeyFlag := !YoudaoHotkeyFlag
	ToolTip(YoudaoHotkeyFlag ? "OFF" : "ON")
	Sleep, 200
}

GetYoudaoWinTitle(){
	; Return "ahk_exe sublime_text.exe"
	Return "ahk_exe wordbook.exe"
}