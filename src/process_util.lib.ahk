
; 计算同名进程的个数
PU_CountByName(name){
    count := 0
    for process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process") {
        if(process.Name == name) { ; `==`为大小写敏感的比较, `=`为不敏感的比较
            count++
        }
    }
    Return count
}

; Install PsSuspend.exe from https://github.com/Ash258/Scoop-Sysinternals.git
PU_PsSuspend(pid_or_name, suspend:=True){
    if (suspend) {
        Run, PsSuspend.exe %pid_or_name%,, Hide
    } else {
        Run, PsSuspend.exe -r %pid_or_name%,, Hide
    }
}

PU_SuspendByPid(pid) {
    hProcess := DllCall("OpenProcess", "UInt", 0x1F0FFF, "Int", 0, "Int", pid)
    If (hProcess) {
        DllCall("ntdll.dll\NtSuspendProcess", "Int", hProcess)
        DllCall("CloseHandle", "Int", hProcess)
    }
}

PU_ResumeByPid(pid) {
    hProcess := DllCall("OpenProcess", "UInt", 0x1F0FFF, "Int", 0, "Int", pid)
    If (hProcess) {
        DllCall("ntdll.dll\NtResumeProcess", "Int", hProcess)
        DllCall("CloseHandle", "Int", hProcess)
    }
}

PU_IsSuspendedByPid(pid) {
    For thread in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Thread WHERE ProcessHandle = " pid)
        If (thread.ThreadWaitReason != 5)
        Return False
    Return True
}