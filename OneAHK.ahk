; ��ݹ���
; ͨ������ģ�����ʽ��չ����, ģ�����õ��ķ���/����������Ҫ����
#SingleInstance, force ; ��ʵ��
; ������UseUnsetGlobal��������о���
#Warn, All, MsgBox
#Warn, UseUnsetGlobal, Off
TrayTip, , ��ݹ���, 1, 16

; ����libģ��
; libģ��ֻ����"��ʼ�������"�ͷ���, ���ܰ����ȼ�/���ִ�/��ǩ/Return
#Include, test.lib.ahk
#Include, tooltip_and_log.lib.ahk
#Include, process_util.lib.ahk
#Include, run_program.lib.ahk
; #Include, auto_start_thunder_down.lib.ahk



; ����extģ��
; extģ��ֻ�����ȼ�/���ִ�/��ǩ�ͷ���, ���ܰ���"��ʼ�������"
; ����淶: 
; aa_bb_cc: �ֲ�����/ģ����
; s_aa_bb_cc: ��̬����
; AaBbCc: ȫ�ֱ���/����/����/��
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


; ����/�˳�/����/��Ŀ¼
^!+r::Reload
^!+q::ExitApp, 0
^!+F1::Run http://ahkcn.sourceforge.net/docs/AutoHotkey.htm
^!+e::Run % A_ScriptDir
