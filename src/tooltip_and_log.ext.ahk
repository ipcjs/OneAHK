; ToolTip和Log函数
; 清空Log
^!+c::
Log(LOG_CMD_CLEAR) 
Debug(LOG_CMD_CLEAR)
Return

; 用来关闭19号ToolTip
RemoveToolTip19:
ToolTip, , , , 19
return
; 用来关闭20号ToolTip
RemoveToolTip20:
ToolTip, , , , 20
return