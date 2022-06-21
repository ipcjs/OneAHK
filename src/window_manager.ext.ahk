;窗口管理

; 切换置顶
Capslock & a::winset,alwaysontop,toggle,a

; 切换透明/不透明
CapsLock & t::
MouseGetPos, MouseX, MouseY, MouseWin
PixelGetColor, MouseRGB, %MouseX%, %MouseY%, RGB
WinGet, Transparent, Transparent, A
WinGet, TransColor, TransColor, A
ToolTips("透明度:", Transparent, "颜色:", TransColor, "鼠标位置颜色:", MouseRGB)
if (TransColor) {
	WinSet, TransColor, Off, A
} else {
	WinSet, TransColor, %MouseRGB% 200, A
}
return
