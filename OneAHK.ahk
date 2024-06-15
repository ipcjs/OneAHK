; 快捷工具
; 通过导入模块的形式扩展功能, 模块中用到的方法/变量尽量不要重名
#SingleInstance, force ; 单实例
; 开启除UseUnsetGlobal以外的所有警告
#Warn, All, MsgBox
#Warn, UseUnsetGlobal, Off
TrayTip, , 快捷工具, 1, 16

; 导入lib模块
; lib模块只包含"初始化代码块"和方法, 不能包含热键/热字串/标签/Return
#Include, src/test.lib.ahk
#Include, src/utils.lib.ahk
#Include, src/tooltip_and_log.lib.ahk
#Include, src/process_util.lib.ahk
#Include, src/run_program.lib.ahk
; #Include, src/rime.lib.ahk
; #Include, src/auto_start_thunder_down.lib.ahk



; 导入ext模块
; ext模块只包含热键/热字串/标签和方法, 不能包含"初始化代码块"
; 代码规范: 
; aa_bb_cc: 局部变量/模块名
; s_aa_bb_cc: 静态变量
; AaBbCc: 全局变量/函数/命令/类
; 
#Include, src/test.ext.ahk
#Include, src/process.ext.ahk
; #Include, src/dr2_helper.ext.ahk
; #Include, src/dr3_helper.ext.ahk
#Include, src/insert_time.ext.ahk
#Include, src/tooltip_and_log.ext.ahk
; #Include, src/youdao_dict_helper.ext.ahk
#Include, src/switch_virtual_decktop.ext.ahk
; #Include, src/close_sublime_purchase_win.ext.ahk
#Include, src/scroll_to_switch_chrome_tab.ext.ahk
; #Include, src/auto_refresh_page_for_js.ext.ahk
; #Include, src/rime.ext.ahk
#Include, src/rime_hotkeys.ext.ahk
; #Include, src/activate_vcxsrv_root_windows.ext.ahk
#Include, src/remote_desktop_keymap.ext.ahk
#Include, src/build-and-decompile-dir.ext.ahk
; #Include, src/island_helper.ext.ahk
; #Include, src/fix_vcxsrv_input_probleam.ext.ahk
; #Include, src/block_number_key.ext.ahk
; #Include, src/torrent_import.ext.ahk
; #Include, src/auto_start_thunder_down.ext.ahk
#Include, src/ahk_helper.ext.ahk
; #Include, src/ps_save_as_png.ext.ahk
#Include, src/rog_key_map.ext.ahk
#Include, src/scrcpy_helper.ext.ahk

; 游戏中禁用一些快捷键
#IfWinNotActive, ahk_exe TslGame.exe
#Include, src/window_manager.ext.ahk
#Include, src/run_program.ext.ahk
; #Include, src/switch_windows_like_mac_os.ext.ahk
#Include, src/mac_os_style_keymaps.ext.ahk
#Include, src/fix_repeated_triggering_of_keys.ext.ahk
#IfWinNotActive
