; ToolTip和Log函数
TOOLTIP_SHOW_NEVER := -2
TOOLTIP_SHOW_ALWAY := -1
LOG_CMD_CLEAR := "__clear__" ; Log命令, 清除Log

LOG_TOOLTIP_SHOW_DEFAULT := TOOLTIP_SHOW_NEVER
; LOG_TOOLTIP_SHOW_DEFAULT := 2000
; LOG_TOOLTIP_SHOW_DEFAULT := TOOLTIP_SHOW_ALWAY

; Log_CACHE_MAX_LINE_NUM := 0
Log_CACHE_MAX_LINE_NUM := 30

; show_time, -2, 不显示; -1为一直显示; >=0为显示且延迟指定时间移除
; which, 19为默认值, 用来做普通的提示文字; 20用作Log输出;
ToolTip(text, x := 0, y := 0, coord_mode := "Window", show_time := 2000, append := False, which := 19){ 
	global CurToolTipCoordMode, ToolTipText19, ToolTipText20, TOOLTIP_SHOW_NEVER, TOOLTIP_SHOW_ALWAY
	if(append){
		ToolTipText%which% .= "`n" . text
	} else {
		ToolTipText%which% := text
	}
	
	to_show := False
	to_remove := False
	if(show_time >= 0){
		to_show := True
		to_remove := True
	} else if(show_time == TOOLTIP_SHOW_ALWAY) {
		to_show := True
	} else if(show_time == TOOLTIP_SHOW_NEVER){
		; pass
	} 
	; Debug("快捷键:", A_ThisHotkey, "to_show:", to_show, "to_remove:", to_remove)
	if(to_show){
		if(A_ThisHotkey){ ; 只有快捷键不为空时才设置坐标模式, 防止改写默认的坐标模式
			CoordMode, ToolTip, % coord_mode
		}		
		ToolTip, % ToolTipText%which%, x, y, which
	}
	if(to_remove){
		SetTimer, RemoveToolTip%which%, % -show_time
	}
}

ToolTips(strings*){
	ToolTip(MergeStrings(strings*))
}

; 显示Log
Log(strings*){
	global LOG_TOOLTIP_SHOW_DEFAULT, TOOLTIP_SHOW_NEVER, TOOLTIP_SHOW_ALWAY, LOG_CMD_CLEAR, LOG_CACHE_MAX_LINE_NUM
	static line_num := 0
	append := True
	text := ""
	if(strings[1] == LOG_CMD_CLEAR){ ; 取数组的元素, 若越界了, 返回空字符串
		text := strings[1]
		append := False
	} else {
		text := MergeStrings(strings*)
	}
	line_num ++ ; log缓存行数超过最大行数后, 清空缓存
	if(LOG_CACHE_MAX_LINE_NUM > 0 And line_num > LOG_CACHE_MAX_LINE_NUM){
		line_num := 1
		append := False
	}
	ToolTip(text, 50, 0, "Screen", LOG_TOOLTIP_SHOW_DEFAULT, append, 20)
}

Debug(strings*){
	OutputDebug, % MergeStrings(strings*)
}
; 打印到Debug客户端
MergeStrings(strings*){
	out := ""
	for i, str in strings {
		out .= str . " "
	}
	Return out
}