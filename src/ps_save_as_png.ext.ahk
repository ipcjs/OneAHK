#IfWinActive, ahk_exe Photoshop.exe

f9::
Send, ^+s
WinWaitActive, 存储为 ahk_class #32770
Send, {Tab}{p 8}{Enter}
WinWaitActive, Adobe Photoshop ahk_class #32770, , 3
if (ErrorLevel) {
    ; pass
} else {
    Send, {Enter}
}
WinWaitActive, PNG 选项 ahk_class StandardMultiplugin_WindowClass
Send, {Enter}
Return

#If