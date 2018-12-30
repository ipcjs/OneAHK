; 从下载的文件导入torrent, 跳过散列检查
F1::
Send {F4}{Esc}^c{Tab 3}{Enter}
WinWaitActive, ahk_class #32770 ahk_exe uTorrent.exe, , 5
if (ErrorLevel == 0) {
	Send, ^v!k
}
return