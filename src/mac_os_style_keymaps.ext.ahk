﻿; macOS风格的快捷键
; 终止进程
#c::Send, ^c

; 左移光标
<!Left::Send, ^{Left}
<!+Left::Send, ^+{Left}
; 右移光标
<!Right::Send, ^{Right}
<!+Right::Send, ^+{Right}

; 切换相同程序的窗口
; https://superuser.com/questions/1604626
<^`::
WinGetClass, OldClass, A
WinGet, ActiveProcessName, ProcessName, A
WinGet, WinClassCount, Count, ahk_exe %ActiveProcessName%
IF WinClassCount = 1
    Return
loop, 2 {
  WinSet, Bottom,, A
  WinActivate, ahk_exe %ActiveProcessName%
  WinGetClass, NewClass, A
  if (OldClass <> "CabinetWClass" or NewClass = "CabinetWClass")
    break
}
Return