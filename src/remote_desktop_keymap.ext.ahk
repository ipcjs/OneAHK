; 映射ctrl+alt+left/right
; 通过按快捷键打开当前文件, 达到控制功能开关的目的...
; ^!+d::
; IfWinExist, remote_desktop_keymap.ext.ahk
;     WinActivate
; Else
;     Run, notepad.exe %A_ScriptDir%\remote_desktop_keymap.ext.ahk
; Return

#IfWinExist, ahk_exe mstsc.exe
; #IfWinActive, ahk_exe studio64.exe
^#Left::^!Left
^#Right::^!Right
^#Down::^!Down
^#Up::^!Up
; #IfWinActive
#IfWinExist


