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

#If, False
; 激活一组窗口, 尝试实现类似macOS的效果
; 参考: https://superuser.com/a/1365443/544036
!`::
WinGetClass, class, A
WinGet, currentWindowId ,, A
WinGet, id, list, ahk_class %class%
Loop, %id%
{
    this_id := id%A_Index%
    WinActivate, ahk_id %this_id%
}
WinActivate, ahk_id %currentWindowId% ;bring the current window back to front
return
#If
