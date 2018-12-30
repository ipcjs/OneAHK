
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