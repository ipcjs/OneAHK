; �������Ƹ�����������
; alt+�Ҽ�, ��/���Ҽ��Զ�����

; dr2_rbutton_flag := True
get_DR2_WIN_TITLE(){
	; return "ahk_exe notepad.exe"
	return "ahk_exe DR2_us.exe"
}

UpdateState(){
	global dr2_rbutton_flag ; ʹ�����ڿ�����ȫ�ֱ���
	ShowText(dr2_rbutton_flag ? "ON" : "OFF")
}

ShowText(text){
	ToolTip, % text, 0, 0
	Sleep, 1000
	ToolTip
}

; ����2��������
#If, WinActive(get_DR2_WIN_TITLE())
f::LButton
g::RButton
!RButton:: 
dr2_rbutton_flag := !dr2_rbutton_flag ; dr2_rbutton_flagδ��ʼ��, Ĭ��Ϊ"", �൱��False
UpdateState()
Return
#If

#If, dr2_rbutton_flag && WinActive(get_DR2_WIN_TITLE())
RButton::Space
#If

; InitGui(){
; 	global
; 	Gui +LastFound +AlwaysOnTop -Caption +ToolWindow ; ���û����Ĵ�������, �ö���
; 	; Gui, Color, FFFF00 ; ���ڱ�����ɫ
; 	Gui, add, Text, vMyText, XXX ; ����ı���, idΪMyText, Ĭ���ı�ΪXXX
; }

; ShowText(text){
; 	global
; 	Gui, Show, x0 y0, NoActivate ; ��(0, 0)����ʾ����
; 	GuiControl, , MyText, % text ; ����MyText���ı�
; 	Sleep, 1000
; 	Gui, Hide ; ���ش���
; }