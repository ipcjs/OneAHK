; 从WebstormProjects自动切换到一个AutoRefresh开头的页面之后, 自动发送F5, 刷新它~
^!+1::
ToolTips("开启页面自动刷新")
SetTimer, AutoRefreshPage, 1
Return

AutoRefreshPage:
WinWaitActive, WebstormProjects, , ,
WinWaitActive, AutoRefresh, , ,
Sleep, 100
If (WinActive("AutoRefresh")) {
	ToolTips("Refresh")
	SendInput, {F5}
} Else {
	ToolTips("No Active")
}
Return