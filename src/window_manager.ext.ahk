;���ڹ���

; �л��ö�
Capslock & a::winset,alwaysontop,toggle,a

; �л�͸��/��͸��
CapsLock & t::
MouseGetPos, MouseX, MouseY, MouseWin
PixelGetColor, MouseRGB, %MouseX%, %MouseY%, RGB
WinGet, Transparent, Transparent, A
WinGet, TransColor, TransColor, A
ToolTips("͸����:", Transparent, "��ɫ:", TransColor, "���λ����ɫ:", MouseRGB)
if (TransColor) {
	WinSet, TransColor, Off, A
} else {
	WinSet, TransColor, %MouseRGB% 200, A
}
return