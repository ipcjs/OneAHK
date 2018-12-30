; 滚轮切换虚拟桌面
; #If MouseIsOver("ahk_class Shell_TrayWnd")
; #If MouseIsBottomOnScreen(30)
#If InStr(MouseInEdge(,, 30), "B")
WheelUp::SwitchVirtualDecktop(-1)
WheelDown::SwitchVirtualDecktop(1)
#If
~LButton & RButton::Send, #{Tab}
; Win+F1->F3切换三个桌面
#F1::
#F2::
#F3::
#F4::
#F5::
cur_num := GetCurNum()
target_num := SubStr(A_ThisHotkey, 3)
delta_num := target_num - cur_num
SwitchVirtualDecktop(delta_num, 0)
; ShowText("桌面: " . GetCurNum())
; MsgBox, , , %cur_num%-%target_num%-%delta_num%
Return
; WheelUp::SendBySleep("^#{Left}")
; WheelDown::SendBySleep("^#{Right}")

SwitchVirtualDecktop(delta, sleep_time := 200, show_tip := True){
	GetCurNum() ; 获取一次CurNum, 使其初始化
	global CurNum
	CurNum += delta
	Log("CurNum:" . CurNum)
	; sign := delta >= 0
	key := delta >= 0 ? "Right" : "Left"
	delta := Abs(delta)
	Loop, % delta{
		SendInput ^#{%key%}
	}
	Sleep, sleep_time
	if(show_tip){
		ToolTip("桌面: " . CurNum, 0, 0, "Screen")
	}
}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

; 判断(X, Y)在屏幕中的哪个位置
MouseInEdge(X := "", Y := "", edge := 8){
	if(X == "" Or Y == ""){
		CoordMode, Mouse, Screen
		MouseGetPos, X, Y
	}
	; 适配多监视器
	SysGet, MonitorCount, MonitorCount
	Loop, % MonitorCount {
		SysGet, Mon, Monitor, % A_Index
		if(X >= MonLeft && Y >= MonTop && X < MonRight && Y < MonBottom){
			str := ""
			if(X < MonLeft + edge){
				str .= "L"
			} else if( X >= MonRight - edge){
				str .= "R"
			}
			if(Y < MonTop + edge){
				str .= "T"
			} else if(Y >= MonBottom - edge){
				str .= "B"
			}
			return str
		}
	}
	return ""
}

GetCurNum(){
	global CurNum
	if(CurNum == ""){
		CurNum := 1
	}
	Return CurNum
}

; 废弃
MouseIsBottomOnScreen(Edge := 8){
	MouseGetPos, X, Y ; 获取当前鼠标位置
	SysGet, Mon, Monitor ; 获取主要监视器的坐标参数
	Log("Y:", Y, "MonBottom:", MonBottom)
	return Y > MonBottom - Edge
}


