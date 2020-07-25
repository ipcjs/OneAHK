s_suspended_process_array := []
s_suspend_black_list := ["explorer.exe", "WerFault.exe", "Evernote.exe", "_Code.exe"]

^!+s::
    WinGet, pid, PID, A
    WinGet, name, ProcessName, A
    If (!name){ 
        name := s_suspended_process_array.Pop()
        if (name) {
            ToolTip("resume(history): " . name)
            PU_PsSuspend(name, false)
        } else {
            ToolTip("Cann't obtain process name")
        }
    } Else If (Array_IndexOfCaseIgnore(s_suspend_black_list, name) != -1){
        ToolTip("Cann't suspend process in black list: " . name)
    } Else {
        is_suspended := PU_IsSuspendedByPid(pid)
        if (is_suspended) {
            ToolTip("resume: " . name)
        } else {
            Array_RemoveIfExist(s_suspended_process_array, name)
            s_suspended_process_array.Push(name)
            ToolTip("suspend: " . name)
        }
        PU_PsSuspend(name, !is_suspended)
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