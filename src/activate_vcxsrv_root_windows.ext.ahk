; ctrl + alt + shift + fuck!!
#IfWinExist, Desktop ahk_exe vcxsrv.exe 
^!+f::
WinHide, Desktop ahk_exe vcxsrv.exe
Return
#IfWinExist

^!+f::
DetectHiddenWindows, On
IfWinExist, ahk_class VcXsrv/x
    WinActivate
Else
    ToolTips("root windows not find...")
Return