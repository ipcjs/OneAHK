﻿; 底部状态栏点击转换成Ctrl+点击, 实现点击切换窗口的效果
#If InStr(MouseInEdge(,, 48), "B") && !IsFullscreen() && !WinExist("ahk_exe uu.exe")
; 按下时发送Down, 防止不能拖拽, 存在往任务栏外拖不会放手的bug(
LButton::Send, {LButton Down}
LButton UP::Send, ^{LButton}
$^LButton::Send, {LButton}
#If

#If !IsFullscreen()
#1::^#1
#2::^#2
#3::^#3
#4::^#4
#5::^#5
#6::^#6
#`::^#6
; $^#1::#1
#If

IsFullscreen() {
    WinGetPos, x, y, w, h, A
    return (x == 0 && y == 0 && w == A_ScreenWidth && h == A_ScreenHeight)
}

#If, False
; 激活一组窗口, 尝试实现类似macOS的效果
; 效果貌似不怎么样, 暂时禁用(
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
