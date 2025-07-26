; #Include, process_util.lib.ahk
; #Include, run_program.lib.ahk

; #IfWinNotExist, ahk_exe YoudaoDict.exe
; 启动有道词典
!+a::
RG_RunProgram("C:\Users\JiangSong\AppData\Local\youdao\dict\Application\YoudaoDict.exe", "C:\Users\ipcjs\AppData\Local\Youdao\Dict\Application\YoudaoDict.exe")
Return
; #If

; 启动Everything
; 方式一: 直接运行
>!f::
RG_RunProgram("C:\Program Files\Everything\Everything.exe", "D:\Dropbox\PortableSoft\Everything\Everything.exe", "C:\Users\ipcjs\Dropbox\PortableSoft\Everything\Everything.exe")
Return

; 启动Cherry Studio
#`::
RG_RunProgram("C:\Users\ipcjs\AppData\Local\Programs\Cherry Studio\Cherry Studio.exe")
Return

; 方式二: 通过判断是否有进程, 决定直接启动还是发送按键, 感觉有一点延迟...不启用
#If, False 
$!f::
; Everything一般有一个后台服务, 故这里判断进程是否小于1
If (PU_CountByName("Everything.exe") <= 1){
    ToolTip("Start Everything")
    Run, D:\Dropbox\PortableSoft\Everything\Everything.exe
} else {
    SendInput, !f
}
Return
#If

