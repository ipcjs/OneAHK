; �������Ƹ�����������
; alt+�Ҽ�, ��/���Ҽ��Զ�����

; dr_rbutton_flag := True
get_DR_WIN_TITLE(){
	; return "ahk_exe notepad.exe"
	return "ahk_exe Dangan3Win.exe"
}

UpdateState(){
	global dr_rbutton_flag ; ʹ�����ڿ�����ȫ�ֱ���
	ShowText(dr_rbutton_flag ? "ON" : "OFF")
}

ShowText(text){
	ToolTip, % text, 0, 0
	Sleep, 1000
	ToolTip
}

; ���谴������
#If, WinActive(get_DR_WIN_TITLE())
f::LButton
g::RButton
!RButton:: 
dr_rbutton_flag := !dr_rbutton_flag ; dr_rbutton_flagδ��ʼ��, Ĭ��Ϊ"", �൱��False
UpdateState()
Return
#If

#If, dr_rbutton_flag && WinActive(get_DR_WIN_TITLE())
RButton::Space
#If