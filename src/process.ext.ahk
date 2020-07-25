s_suspended_process_array := []
s_suspend_black_list := ["explorer.exe", "WerFault.exe", "Evernote.exe", "_Code.exe", "AutoHotkey.exe", "steam.exe"]
; 太多进程suspend后会有问题, 实在不行, 考虑直接用白名单...
; 注释掉白名单, 则不使用它, 只使用黑名单, 可以用于测试进程是否能够suspend
s_suspend_white_list := ["Dangan3Win.exe", "chrome.exe", "Code.exe"]

^!+s::
    WinGet, pid, PID, A
    WinGet, name, ProcessName, A
    ; werfault.exe是未响应弹窗的进程名
    If (!name || name = "WerFault.exe"){ 
        name := s_suspended_process_array.Pop()
        if (name) {
            ToolTip("resume(history): " . name)
            PU_PsSuspend(name, false)
        } else {
            ToolTip("Cann't obtain process name")
        }
    } Else If (Array_IndexOfCaseIgnore(s_suspend_black_list, name) != -1){
        ToolTip("Cann't suspend process in black list: " . name)
    } Else If (!(s_suspend_white_list && Array_IndexOfCaseIgnore(s_suspend_white_list, name) == -1)) {
        is_suspended := PU_IsSuspendedByPid(pid)
        if (is_suspended) {
            ToolTip("resume: " . name)
        } else {
            Array_RemoveIfExist(s_suspended_process_array, name)
            s_suspended_process_array.Push(name)
            ToolTip("suspend: " . name)
        }
        PU_PsSuspend(name, !is_suspended)
    } Else {
        ToolTip("Cann't suspend process that are not in white list: " . name)
    }
Return

#If, False
F1::
; WinGet, active_win, ProcessName, A
WinGet, pid, PID, A
if (PU_IsSuspendedByPid(pid)) {
    PU_ResumeByPid(pid)
} else {
    PU_SuspendByPid(pid)
}
Return
#If