; ��WebstormProjects�Զ��л���һ��AutoRefresh��ͷ��ҳ��֮��, �Զ�����F5, ˢ����~
^!+1::
ToolTips("����ҳ���Զ�ˢ��")
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