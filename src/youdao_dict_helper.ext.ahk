; �е��ʵ䵥�ʱ� ����
#If, WinActive(GetYoudaoWinTitle())
~RButton & LButton::
!RButton::ToYoudaoHotkeyFlag()
; LButton:: ToolTip(A_TimeSincePriorHotkey)

#If, !YoudaoHotkeyFlag && WinActive(GetYoudaoWinTitle())  ; YoudaoHotkeyFlagĬ��ΪFalse, ��ʾ�����ȼ�...
LButton::
RButton::
%A_ThisHotkey%ClickCount ++
SetTimer, %A_ThisHotkey%Click, -300
Return
; ʹ�ù���, �رտ�ݼ�
WheelUp::
WheelDown::ToYoudaoHotkeyFlag()
#If

; %A_ThisHotkey%Click
LButtonClick:
; ToolTips(A_TimeSincePriorHotkey, LButtonClickCount)
if (LButtonClickCount == 1) {
	Send, % LButtonYDFlag ? "{Left}" : "{Space}" ; LButtonYDFlagĬ��ΪFalse, �ȷ��Ϳո�
	LButtonYDFlag := !LButtonYDFlag
} else if (LButtonClickCount == 2) {
	Send, {Space}{Left}
	; ToolTips("Next")
} else if (LButtonClickCount == 3) {
	; alt+tab�л������ʱ���, Ĭ�ϲ��Ჶ���������, Ҫ���һ�µ��ʽ���
	Send, {LButton}
	ToolTip("���")
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
	ToolTip("�Ҽ�")
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