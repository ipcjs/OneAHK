; ctrl + alt + shift + fuck!!
^!+f::
; 当使用 alt + tab 切换到 VcXsrv 的窗口时, 大概率会导致方向键被映射成数字区的按键
; 此时, 点击一下右下角 VcXsrv 的图标, 再把鼠标移动回来, 就行了...
; ==> 推荐使用 activate_vcxsrv_root_windows.ext.ahk 替代该脚本
CoordMode, Mouse, Screen
; SendMode, Input
MouseGetPos, mouse_x, mouse_y
; WinGet, active_id, ID, A
; ToolTips("(", mouse_x, ", ", mouse_y, ")", "id=", active_id)
Click 1651, 1058 ; VcXsrv的图标放在这个位置...
; MouseClick, Left, 1651, 1058
; Sleep, 3000
MouseMove, %mouse_x%, %mouse_y%
; WinActivate, ahk_id %active_id%
Return

