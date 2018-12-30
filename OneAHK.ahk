; 快捷工具
; 通过导入模块的形式扩展功能, 模块中用到的方法/变量尽量不要重名
#SingleInstance, force ; 单实例
; 开启除UseUnsetGlobal以外的所有警告
#Warn, All, MsgBox
#Warn, UseUnsetGlobal, Off
TrayTip, , 快捷工具, 1, 16

; 导入lib模块
; lib模块只包含"初始化代码块"和方法, 不能包含热键/热字串/标签/Return
#Include, test.lib.ahk
#Include, tooltip_and_log.lib.ahk
#Include, process_util.lib.ahk
#Include, run_program.lib.ahk
; #Include, auto_start_thunder_down.lib.ahk



; 导入ext模块
; ext模块只包含热键/热字串/标签和方法, 不能包含"初始化代码块"
; 代码规范: 
; aa_bb_cc: 局部变量/模块名
; s_aa_bb_cc: 静态变量
; AaBbCc: 全局变量/函数/命令/类
; 
#Include, test.ext.ahk
; #Include, dr2_helper.ext.ahk
; #Include, dr3_helper.ext.ahk
#Include, insert_time.ext.ahk
#Include, window_manager.ext.ahk
#Include, tooltip_and_log.ext.ahk
; #Include, youdao_dict_helper.ext.ahk
#Include, switch_virtual_decktop.ext.ahk
#Include, close_sublime_purchase_win.ext.ahk
#Include, scroll_to_switch_chrome_tab.ext.ahk
; #Include, auto_refresh_page_for_js.ext.ahk
; #Include, prime_reboot.ext.ahk
#Include, activate_vcxsrv_root_windows.ext.ahk
#Include, run_program.ext.ahk
#Include, remote_desktop_keymap.ext.ahk
#Include, build-and-decompile-dir.ext.ahk
; #Include, island_helper.ext.ahk
; #Include, fix_vcxsrv_input_probleam.ext.ahk
; #Include, block_number_key.ext.ahk
; #Include, torrent_import.ext.ahk
; #Include, auto_start_thunder_down.ext.ahk


; 重启/退出/帮助/打开目录
^!+r::Reload
^!+q::ExitApp, 0
^!+F1::Run http://ahkcn.sourceforge.net/docs/AutoHotkey.htm
^!+e::Run % A_ScriptDir
